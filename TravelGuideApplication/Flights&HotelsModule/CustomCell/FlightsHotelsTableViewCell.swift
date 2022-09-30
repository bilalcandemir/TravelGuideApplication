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
    
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        
        
        
        selectionStyle = .none
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 180))

        let gradient = CAGradientLayer()

        gradient.frame = view.frame

        gradient.colors = [UIColor.clear.cgColor, UIColor(named: "gradientEndColor")!.cgColor]

        gradient.locations = [0.0, 1.0]

        view.layer.insertSublayer(gradient, at: 0)

        mainImageView.addSubview(view)

        mainImageView.bringSubviewToFront(view)
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
    func setFlightsData(_ item:Flights, _ isSearch:Bool){
        mainTitleLabel.text = item.flightName
        mainDescriptionLabel.text = item.flightDescription
        
        typeLabel.text = "FLIGHT"
        
        if isSearch {
            typeLabel.isHidden = false
            typeView.isHidden = false
        }
        else {
            typeLabel.isHidden = true
            typeView.isHidden = true
        }
        
       
    }
    
    func setHotelsData(_ item:Hotels, _ isSearch:Bool){
        mainTitleLabel.text = item.hotelName
        mainDescriptionLabel.text = item.hotelDescription
        typeLabel.text = "HOTEL"
        if isSearch {
            typeLabel.isHidden = false
            typeView.isHidden = false
        }
        else {
            typeLabel.isHidden = true
            typeView.isHidden = true
        }
            
        
        
    }
    
}
