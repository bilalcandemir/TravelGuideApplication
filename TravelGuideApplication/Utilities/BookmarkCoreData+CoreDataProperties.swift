//
//  BookmarkCoreData+CoreDataProperties.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/8/22.
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
    @NSManaged public var bookmarkDate: String?

}

extension BookmarkCoreData : Identifiable {

}
