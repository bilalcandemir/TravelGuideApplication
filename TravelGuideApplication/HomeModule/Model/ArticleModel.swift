//
//  ArticleModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

class ArticleModel {
    
    var articlesData = [Article]()
    
    func loadMockData(){
        var item = Article(imageURL: "imageArticle1", articleType: "EXPERIENCE", articleTitle: "Beautiful Alley Scene in Old Town in Europe at Sunset")
        articlesData.append(item)
        
        item = Article(imageURL: "imageArticle1", articleType: "SHOPPING", articleTitle: "The Ultimate Guide to Shopping for Travel")
        articlesData.append(item)
    }
}
