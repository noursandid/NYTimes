//
//  NewYorkTimesTests.swift
//  NewYorkTimesTests
//
//  Created by Nour Sandid on 2/23/19.
//  Copyright © 2019 NewYorkTimes. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class NewYorkTimesTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    func testAPISettings() {
        let urlString = APISettings.getNewYorkTimesURL(forPeriod: Period.month.rawValue)
        XCTAssertEqual(urlString, "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=RrldVEumHP67Rb6OGkICkcJKvr1DP2EH")
    }
    
    func testPeriod() {
        XCTAssertEqual(Period.month.rawValue, 30)
        XCTAssertEqual(Period.week.rawValue, 7)
        XCTAssertEqual(Period.day.rawValue, 1)
    }
    
    func testMetaData() {
        let metaJSONString = "{\"url\":\"https://static01.nyt.com/images/2019/02/18/opinion/18x-coldcase/18x-coldcase-thumbStandard.jpg\",\"format\":\"Standard Thumbnail\",\"height\":75,\"width\":75}"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        XCTAssertNotNil(try? decoder.decode(MetaData.self, from: metaJSONString.data(using: .utf8)!))
        
    }
    func testMedia() {
        let mediaJSONString = "{\"type\":\"image\",\"subtype\":\"photo\",\"caption\":\"Caption Test\",\"copyright\":\"copyright test\",\"approved_for_syndication\":0,\"media-metadata\":[{\"url\":\"https://static01.nyt.com/images/2019/02/14/us/british-irish-dialect-quiz-promo-1550183830563/british-irish-dialect-quiz-promo-1550183830563-thumbStandard-v3.jpg\",\"format\":\"Standard Thumbnail\",\"height\":75,\"width\":75},{\"url\":\"https://static01.nyt.com/images/2019/02/14/us/british-irish-dialect-quiz-promo-1550183830563/british-irish-dialect-quiz-promo-1550183830563-mediumThreeByTwo210-v3.jpg\",\"format\":\"mediumThreeByTwo210\",\"height\":140,\"width\":210},{\"url\":\"https://static01.nyt.com/images/2019/02/14/us/british-irish-dialect-quiz-promo-1550183830563/british-irish-dialect-quiz-promo-1550183830563-mediumThreeByTwo440-v3.jpg\",\"format\":\"mediumThreeByTwo440\",\"height\":293,\"width\":440}]}"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        XCTAssertNotNil(try? decoder.decode(Media.self, from: mediaJSONString.data(using: .utf8)!))
    }

    override func tearDown() {
        
    }
}
