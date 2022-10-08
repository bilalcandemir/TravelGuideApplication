//
//  DetailsModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/8/22.
//

import Foundation
import CoreData

class DetailsModel {
    func addBookmark(_ bookmarkId:Int, _ bookmarkName:String, _ bookmarkDate:String, _ bookmarkDescription:String){
        let managedContex = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let bookmark = BookmarkCoreData(context: managedContex)
        
        bookmark.setValue(bookmarkId, forKey: #keyPath(BookmarkCoreData.bookmarkId))
        bookmark.setValue(bookmarkName, forKey: #keyPath(BookmarkCoreData.bookmarkName))
        bookmark.setValue(bookmarkDate, forKey: #keyPath(BookmarkCoreData.bookmarkDate))
        bookmark.setValue(bookmarkDescription, forKey: #keyPath(BookmarkCoreData.bookmarkDescription))
        print("\(bookmarkId)-\(bookmarkName)-\(bookmarkDate)-\(bookmarkDescription)")
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
    
    func fetchBookmarks(_ id:Int, _ isFlight:Bool, _ flightDate:String?){
        
        let fetchRequest: NSFetchRequest<BookmarkCoreData> = BookmarkCoreData.fetchRequest()
                
                do {
                    if isFlight {
                        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
                        
                        fetchRequest.predicate = NSPredicate(format: "bookmarkId LIKE %@", String(id))
                        guard let flightDate = flightDate else {
                            return
                        }

                        fetchRequest.predicate = NSPredicate(format: "bookmarkDate LIKE %@", flightDate)
                        
                        let results = try context.fetch(fetchRequest)
                        print(results.first?.bookmarkId)
                        //return results
                    }
                    
                    else {
                        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
                        
                        fetchRequest.predicate = NSPredicate(format: "bookmarkId LIKE %@", String(id))
                        
                        let results = try context.fetch(fetchRequest)
                        print(results.first?.bookmarkName)
                        //return results
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    //return []
                
            }
    }
}
