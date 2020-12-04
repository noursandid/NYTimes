//
//  Media.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

struct Media: Codable {
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    var approvedForSyndication: Bool?
    var mediaMetadata: [MetaData]?
    private enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}
