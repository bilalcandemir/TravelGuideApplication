//
//  DetailViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/8/22.
//

import Foundation



class DetailViewModel {
    let detailModel = DetailsModel()
    var detailCoreDataObject:BookmarkCoreData?
    
    func addToBookmark(_ bookmarkId:Int, _ bookmarkName:String, _ bookmarkDate:String, _ bookmarkDescription:String, _ bookmarkImageURL:String, _ bookmarkType:bookmarkType){
        detailModel.addBookmark(bookmarkId, bookmarkName, bookmarkDate, bookmarkDescription, bookmarkImageURL, bookmarkType)
    }
    
    func removeBookmark(){
        detailModel.removeBookmark(detailCoreDataObject!)
    }
    
    func checkBookmark(_ id:Int, _ isFlight:Bool, _ flightDate:String?) -> Bool {
        
        if isFlight {
            let detailData = detailModel.fetchBookmarks(id, true, flightDate)
            if detailData == [] {
                return false
            }
            else {
                detailCoreDataObject = detailData.first
                return true
            }
        }
        else {
            let detailData = detailModel.fetchBookmarks(id, false, nil)
            if detailData == [] {
                return false
            }
            else {
                detailCoreDataObject = detailData.first
                return true
            }
        }
    }
}