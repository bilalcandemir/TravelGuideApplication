//
//  FlightsHotelsTableViewCell.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit

class FlightsHotelsTableViewCell: UITableViewCell {
    
    static let identifier = "FlightsHotelsTableViewCell"
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setFlightsData(_ item:Flights){
        mainTitleLabel.text = item.flightName
        mainDescriptionLabel.text = item.flightDescription
    }
    
    func setHotelsData(_ item:Hotels){
        mainTitleLabel.text = item.hotelName
        mainDescriptionLabel.text = item.hotelDescription
    }
    
}
