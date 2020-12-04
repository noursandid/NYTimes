//
//  _Date.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit
class DateFormat {
    public static var formatter: DateFormat = DateFormat()
    public var YMD = DateFormatter()
    var yyyymmddTHHmmssZ = DateFormatter()
    init() {
        self.YMD.dateFormat = "YYYY-mm-dd"
        self.yyyymmddTHHmmssZ.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
}
extension Date {
    public static func fromYMDDate(dateString: String) -> Date? {
        return DateFormat.formatter.YMD.date(from: dateString)
    }
    public func representableString() -> String {
        return DateFormat.formatter.YMD.string(from: self)
    }
    public static func fromDatabaseDate(dateString: String) -> Date? {
        return DateFormat.formatter.yyyymmddTHHmmssZ.date(from: dateString)
    }
}
