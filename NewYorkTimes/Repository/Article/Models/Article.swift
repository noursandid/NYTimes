//
//  Article.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

struct Article: Codable, Equatable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    var url: String?
    var adxKeywords: String?
    var column: String?
    var section: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var publishedDate: Date?
    var source: String?
    var identifier: Int?
    var assetID: Int?
    var views: Int?
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var media: [Media]?
    var uri: String?
    private enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx-keywords"
        case column
        case section
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case identifier = "id"
        case assetID = "asset_id"
        case views
        case desFacet
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case uri
    }
}
