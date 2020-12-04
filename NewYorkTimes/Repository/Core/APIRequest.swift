//
//  SundeedAPIRequest.swift
//  AppointSync
//
//  Created by Nour Sandid on 1/8/19.
//  Copyright © 2019 Sundeed. All rights reserved.
//

import UIKit

class APIRequest<T: Codable> {
    private var url: String!
    private var method: String = "GET"
    private var parameters: [String: Any] = [:]
    private var headers: [String: String] = [:]
    func withURL(_ url: String) -> APIRequest {
        self.url = url
        return self
    }
    func withMethod(_ method: String) -> APIRequest {
        self.method = method
        return self
    }
    func withParameters(_ parameters: [String: Any]) -> APIRequest {
        self.parameters = parameters
        return self
    }
    func withHeaders(_ headers: [String: String]) -> APIRequest {
        self.headers = headers
        return self
    }
    private func buildRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        if self.method == "POST"{
            let body = try? JSONSerialization.data(withJSONObject: self.parameters)
            request.httpBody = body
        }
        request.allHTTPHeaderFields = self.headers
        URLSession.shared.configuration.allowsCellularAccess = true
        URLSession.shared.configuration.shouldUseExtendedBackgroundIdleMode = true
        URLSession.shared.configuration.waitsForConnectivity = true
        return request
    }
    func requestArray(completion: ((_ response: Response<T>) -> Void)?) {
        DispatchQueue.global().async {
            guard self.url != nil else {
                print("Please specify the URL")
                return
            }
            guard let url = URL(string: self.url) else {
                print("Please Enter a valid URL")
                return
            }
            let request = self.buildRequest(url)
            let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
                let response = self.deserialize(data: data)
                DispatchQueue.main.async {
                    completion?(response ?? Response<T>(status: "Error"))
                }
            }
            task.resume()
        }
    }
    func deserialize(data: Data?) -> Response<T>? {
        guard let data = data else {
            return nil
        }
        print(String(data: data, encoding: .utf8))
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let object = try? jsonDecoder.decode( Response<T>.self, from: data)
        return object
    }
}
