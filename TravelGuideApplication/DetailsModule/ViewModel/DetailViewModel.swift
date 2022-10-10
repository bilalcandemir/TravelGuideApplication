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
    
    // Send the datas which came from view controller to model and save object to core data
    func addToBookmark(_ bookmarkId:Int, _ bookmarkName:String, _ bookmarkDate:String, _ bookmarkDescription:String, _ bookmarkImageURL:String, _ bookmarkType:bookmarkType){
        detailModel.addBookmark(bookmarkId, bookmarkName, bookmarkDate, bookmarkDescription, bookmarkImageURL, bookmarkType)
    }
    
    // Remove data from core data
    func removeBookmark(){
        detailModel.removeBookmark(detailCoreDataObject!)
    }
    
    // Check bookmark status, item date parameter is for flight data. I am checking flight number and flight date because inside of flight api data has too many same flight number.
    func checkBookmarkStatus(_ selectedCategory:String, _ itemId:Int, _ itemDate:String) -> Bool{
        if selectedCategory == "FLIGHT" {
            if checkBookmark(itemId , true, itemDate){
                return true
            }
            else {
                return false
            }
        }
        else if selectedCategory == "HOTEL" {
            if checkBookmark(itemId , false, nil){
                return true
            }
            else {
                return false
            }
        }
        else {
            if checkBookmark(itemId, false, nil){
                return true
            }
            return false
        }
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
