//
//  APISettings.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

class APISettings {
    static let url = "https://api.nytimes.com/svc/mostpopular/v2/viewed/"
    static let newYorkTimesApiKey = "RrldVEumHP67Rb6OGkICkcJKvr1DP2EH"
    static func getNewYorkTimesURL(forPeriod period: Int) -> String {
        return "\(APISettings.url)\(period).json?api-key=\(APISettings.newYorkTimesApiKey)"
    }
}
