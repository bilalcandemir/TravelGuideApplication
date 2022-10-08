//
//  FlightsHotelsTableViewCell.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit
import Kingfisher

class FlightsHotelsTableViewCell: UITableViewCell {
    
    static let identifier = "FlightsHotelsTableViewCell"
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainDescriptionLabel: UILabel!
    
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 180))

        let gradient = CAGradientLayer()

        gradient.frame = view.frame

        gradient.colors = [UIColor.clear.cgColor, UIColor(named: "gradientEndColor")!.cgColor]

        gradient.locations = [0.0, 1.0]

        view.layer.insertSublayer(gradient, at: 0)
        
        
        mainImageView.addSubview(view)

        mainImageView.bringSubviewToFront(view)
        
        mainImageView.layer.cornerRadius = 8
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
    func setFlightsData(_ item:Flights, _ isSearch:Bool){
        mainTitleLabel.text = "\(item.origin) - \(item.destination)"
        mainDescriptionLabel.text = String(item.flight_number)
        mainImageView.contentMode = .scaleAspectFit
        
        if item.airline == "TK" {
            mainImageView.image = UIImage(named: "tkLogo")
        }
        
        else if item.airline == "PC" {
            mainImageView.image = UIImage(named: "pcLogo")
        }
        
        else if item.airline == "XC" {
            mainImageView.image = UIImage(named: "xcLogo")
            
        }
        
        else if item.airline == "W6" {
            mainImageView.image = UIImage(named: "w6Logo")
        }
        
        else if item.airline == "EW" {
            mainImageView.image = UIImage(named: "ewLogo")
        }
        
        else {
            mainImageView.image = UIImage(named: "normalFlightLogo")
        }
        
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
    
    func setHotelsData(_ item:HotelsCellModel, _ isSearch:Bool){
        mainTitleLabel.text = item.hotelName
        mainDescriptionLabel.text = String(item.hotelAddress)
        mainImageView.contentMode = .scaleToFill
        let url = URL(string: item.hotelImageURL)
        mainImageView.kf.setImage(with: url)
        
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
    
    func setBookmarksData(_ item:Bookmark, _ isSearch:Bool){
        typeLabel.isHidden = true
        typeView.isHidden = true
        
        mainTitleLabel.text = item.bookmarkName
        mainDescriptionLabel.text = item.bookmarkDescription
    }
    
}
