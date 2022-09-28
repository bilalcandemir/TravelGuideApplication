//
//  TopArticlesCollectionViewCell.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit

class TopArticlesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopArticlesCollectionViewCell"
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
        self.layer.shadowColor = UIColor(named: "tabBarShadow")?.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        
        self.layer.masksToBounds = false
    }
    
    func showData(_ item:Article){
        articleImageView.image = UIImage(named: item.imageURL)
        articleTypeLabel.text = item.articleType
        articleTitleLabel.text = item.articleTitle
    }
}
