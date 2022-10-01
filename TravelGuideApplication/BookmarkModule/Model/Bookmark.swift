//
//  Bookmark.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import Foundation

enum BookmarkType {
case Hotels, Flights, Articles
}

struct Bookmark {
    var bookmarkType:BookmarkType
    var bookmarkName:String
    var bookmarkDescription:String
}
