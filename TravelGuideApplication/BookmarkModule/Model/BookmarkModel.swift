//
//  BookmarkModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import Foundation
import CoreData

class BookmarkModel {
    var bookMarkArray:[Bookmark] = []
    var bookmarkCoreDataArray:[BookmarkCoreData] = []
    
    func loadBookmarkData(){
        var item = Bookmark(bookmarkType: .Flights, bookmarkName: "TC-421", bookmarkDescription: "İstanbul - New York")
        bookMarkArray.append(item)
        
        item = Bookmark(bookmarkType: .Hotels, bookmarkName: "Amsterdam", bookmarkDescription: "İstanbul - Amsterdam")
        bookMarkArray.append(item)
        
        item = Bookmark(bookmarkType: .Articles, bookmarkName: "SHOPPING", bookmarkDescription: "The Ultimate Guide to Shopping for Travel")
        bookMarkArray.append(item)
        
        item = Bookmark(bookmarkType: .Flights, bookmarkName: "TC-761", bookmarkDescription: "Dalaman - Dubai")
        bookMarkArray.append(item)
    }
    
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
