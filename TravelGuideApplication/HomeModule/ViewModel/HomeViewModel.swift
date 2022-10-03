//
//  HomeViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation


class HomeViewModel {
    let articleModel = ArticleModel()
    
    func loadData(){
        articleModel.loadMockData()
    }
    
    func returnData() -> [Article]{
        return articleModel.articlesData
    }
}
