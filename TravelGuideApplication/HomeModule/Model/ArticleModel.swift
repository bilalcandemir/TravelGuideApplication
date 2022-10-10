//
//  ArticleModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

class ArticleModel {
    
    var articlesData = [Article]()
    
    // I added static article data , so i didn't find the proper api and data.
    func addArticleData(){
        var item = Article(itemId: 1, imageName: "imageArticle1", articleType: "EXPERIENCE", articleTitle: "Beautiful Alley Scene in Old Town in Europe at Sunset", description: "Roma is the capital city of Italy. It is also the capital of the Lazio region, the centre of the Metropolitan City of Rome, and a special comune named Comune di Roma Capitale. With 2,860,009 residents in 1,285 km2 (496.1 sq mi), Rome is the country's most populated comune and the third most populous city in the European Union by population within city limits.")
        articlesData.append(item)
        
        item = Article(itemId: 2, imageName: "firenzeImage", articleType: "TRAVEL", articleTitle: "One Day In Firenze, Italy to eat Pizza", description: "Florence was a centre of medieval European trade and finance and one of the wealthiest cities of that era. It is considered by many academics to have been the birthplace of the Renaissance, becoming a major artistic, cultural, commercial, political, economic and financial center.")
        articlesData.append(item)
        
        item = Article(itemId: 3, imageName: "mallOfAmericaImage", articleType: "SHOPPING", articleTitle: "Mall Of America, The biggest Mall in the USA", description: "Mall of America (MOA) is a shopping mall located in Bloomington, Minnesota, a suburb of the Twin Cities in Minnesota, United States. It lies southeast of the junction of Interstate 494 and Minnesota State Highway 77, north of the Minnesota River, and across the Interstate from the Minneapolis–Saint Paul International Airport. It opened in 1992, and is the largest mall in the United States, the largest in the Western Hemisphere, and the ninth largest shopping mall in the world.")
        articlesData.append(item)
        
        item = Article(itemId: 4, imageName: "eiffelImage", articleType: "HISTORICAL", articleTitle: "Behind The Effects of Eiffel Tower", description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.")
        articlesData.append(item)
        
        item = Article(itemId: 5, imageName: "osloImage", articleType: "CAMPING", articleTitle: "Camp in Oslo Norway, Live another experience", description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.")
        articlesData.append(item)
    }
}

