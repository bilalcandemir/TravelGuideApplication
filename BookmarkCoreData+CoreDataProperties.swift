//
//  BookmarkCoreData+CoreDataProperties.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//
//

import Foundation
import CoreData


extension BookmarkCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookmarkCoreData> {
        return NSFetchRequest<BookmarkCoreData>(entityName: "BookmarkCoreData")
    }

    @NSManaged public var bookmarkDescription: String?
    @NSManaged public var bookmarkId: Int16
    @NSManaged public var bookmarkName: String?

}

extension BookmarkCoreData : Identifiable {

}
