//
//  BookmarkViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import Foundation

class BookmarkViewModel {
    var bookmarkModel = BookmarkModel()
    
    func loadData(){
        bookmarkModel.loadBookmarkData()
    }
}
