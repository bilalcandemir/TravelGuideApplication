//
//  DetailViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/8/22.
//

import Foundation


class DetailViewModel {
    let detailModel = DetailsModel()
    
    func addToBookmark(_ bookmarkId:Int, _ bookmarkName:String, _ bookmarkDate:String, _ bookmarkDescription:String){
        detailModel.addBookmark(bookmarkId, bookmarkName, bookmarkDate, bookmarkDescription)
    }
    
    func checkBookmark(_ id:Int, _ isFlight:Bool, _ flightDate:String?){
        if isFlight {
            detailModel.fetchBookmarks(id, true, flightDate)
        }
        else {
            detailModel.fetchBookmarks(id, false,  nil)
        }
        
    }
}
