//
//  Response.swift
//  AppointSync
//
//  Created by Nour Sandid on 1/8/19.
//  Copyright © 2019 SUNDEED. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
    var status: String
    var copyright: String?
    var numResults: Int?
    var results: [T]?
    private enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
    public var isOK: Bool {
        return status == "OK" && results != nil
    }
    init(status: String) {
        self.status = status
    }
}
