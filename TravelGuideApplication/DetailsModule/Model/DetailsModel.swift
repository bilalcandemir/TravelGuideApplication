//
//  DetailsModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/8/22.
//

import Foundation
import CoreData

enum bookmarkType{
    case hotel, flight, article
}

class DetailsModel {
    let managedContex = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
    
    // Add bookmark from Core Data
    func addBookmark(_ bookmarkId:Int, _ bookmarkName:String, _ bookmarkDate:String, _ bookmarkDescription:String, _ bookmarkImageURL:String, _ bookmarkType:bookmarkType){
        let bookmark = BookmarkCoreData(context: managedContex)
        bookmark.setValue(bookmarkId, forKey: #keyPath(BookmarkCoreData.bookmarkId))
        bookmark.setValue(bookmarkName, forKey: #keyPath(BookmarkCoreData.bookmarkName))
        bookmark.setValue(bookmarkDate, forKey: #keyPath(BookmarkCoreData.bookmarkDate))
        bookmark.setValue(bookmarkDescription, forKey: #keyPath(BookmarkCoreData.bookmarkDescription))
        bookmark.setValue(bookmarkImageURL, forKey: #keyPath(BookmarkCoreData.bookmarkImageURL))
        if bookmarkType == .hotel {
            bookmark.setValue("HOTEL", forKey: #keyPath(BookmarkCoreData.bookmarkType))
        }
        else if bookmarkType == .flight {
            bookmark.setValue("FLIGHT", forKey: #keyPath(BookmarkCoreData.bookmarkType))
        }
        else {
            bookmark.setValue("ARTICLE", forKey: #keyPath(BookmarkCoreData.bookmarkType))
        }
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
    
    // Remove bookmark from Core Data
    func removeBookmark(_ item:BookmarkCoreData){
        managedContex.delete(item)
        do {
            try managedContex.save()
        }
        
        catch {
            print("error")
        }
    }
    // Fetch Bookmark in detail model to understand is bookmark added or not. And set bookmark button to add or remove
    func fetchBookmarks(_ id:Int, _ isFlight:Bool, _ flightDate:String?) -> [BookmarkCoreData]{
        let fetchRequest: NSFetchRequest<BookmarkCoreData> = BookmarkCoreData.fetchRequest()
        
        do {
            // If selected cell is flight I'm looking flight id and bookmark date because flight data include too much flights with same flight number.
            if isFlight {
                fetchRequest.predicate = NSPredicate(format: "bookmarkId LIKE %@", String(id))
                guard let flightDate = flightDate else {
                    return []
                }
                fetchRequest.predicate = NSPredicate(format: "bookmarkDate LIKE %@", flightDate)
                let results = try managedContex.fetch(fetchRequest)
                return results
            }
            
            // Just check with hotel id
            else {
                fetchRequest.predicate = NSPredicate(format: "bookmarkId LIKE %@", String(id))
                let results = try managedContex.fetch(fetchRequest)
                return results
            }
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
