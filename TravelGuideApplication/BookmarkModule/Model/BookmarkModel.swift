//
//  BookmarkModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import Foundation
import CoreData

class BookmarkModel {
    
    var bookmarkCoreDataArray:[BookmarkCoreData] = []
    // Fetch all bookmark data from core data
    func fetchData(){
        let fetchRequest: NSFetchRequest<BookmarkCoreData> = BookmarkCoreData.fetchRequest()
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            bookmarkCoreDataArray = results
        } catch {
            print(error.localizedDescription)
        }
    }
}
