//
//  FlightsHotelsTableViewCell.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit
import Kingfisher

class FlightsHotelsTableViewCell: UITableViewCell {
    
    // Use identifier directly inside of helper class without typo
    static let identifier = "FlightsHotelsTableViewCell"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainDescriptionLabel: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        // Created a view for gradient color inside of table view cell height is 180 because i gave a static height on heightForRow at function.
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 180))
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor(named: "gradientEndColor")!.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        
        // Add the gradient view to image view and corner radius
        mainImageView.addSubview(view)
        mainImageView.bringSubviewToFront(view)
        mainImageView.layer.cornerRadius = 8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Flights Data will set here, items come from table view helper class and also related classes model
    func setFlightsData(_ item:Flights, _ isSearch:Bool){
        mainTitleLabel.text = "\(item.origin) - \(item.destination)"
        mainDescriptionLabel.text = String(item.flight_number)
        
        // Image view content mode setted scale aspect fit to show airline icons properly
        mainImageView.contentMode = .scaleAspectFit
        
        // Airline Logos set
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
        
        // Type Label text change
        typeLabel.text = "FLIGHT"
        
        // We have type label inside of search view controller design so we have to check this situation because we use same table view cell in other view controllers
        if isSearch {
            typeLabel.text = "FLIGHT"
            typeLabel.isHidden = false
            typeView.isHidden = false
        }
        else {
            // If chosen view controller isn't search view controller we hidden the type label
            typeLabel.isHidden = true
            typeView.isHidden = true
        }
    }
    
    // Hotels Data will set here, items come from table view helper class and also related classes model
    func setHotelsData(_ item:HotelsCellModel, _ isSearch:Bool){
        mainTitleLabel.text = item.hotelName
        mainDescriptionLabel.text = String(item.hotelAddress)
        mainImageView.contentMode = .scaleToFill
        
        // Used the kingfisher for set hotels image with api image url data
        let url = URL(string: item.hotelImageURL)
        mainImageView.kf.setImage(with: url)
        
        typeLabel.text = "HOTEL"
        
        // We have type label inside of search view controller design so we have to check this situation because we use same table view cell in other view controllers
        if isSearch {
            typeLabel.text = "HOTEL"
            typeLabel.isHidden = false
            typeView.isHidden = false
        }
        else {
            typeLabel.isHidden = true
            typeView.isHidden = true
        }
    }
    
    // Bookmark Data will set here, items come from table view helper class and also related classes model
    func setBookmarksData(_ item:BookmarkCoreData, _ isSearch:Bool){
        typeLabel.isHidden = true
        typeView.isHidden = true
        
        if item.bookmarkType == "HOTEL" {
            let url = URL(string: item.bookmarkImageURL ?? "")
            mainImageView.kf.setImage(with: url)
            typeLabel.text = "HOTEL"
            typeView.isHidden = false
            typeLabel.isHidden = false
        }
        else if item.bookmarkType == "FLIGHT" {
            typeLabel.text = "FLIGHT"
            typeView.isHidden = false
            typeLabel.isHidden = false
            
            mainImageView.image = UIImage(named: "normalFlightLogo")
            
        }
        else {
            typeLabel.text = "ARTICLE"
            typeView.isHidden = false
            typeLabel.isHidden = false
            mainImageView.contentMode = .scaleToFill
            mainImageView.image = UIImage(named: item.bookmarkImageURL ?? "")
        }
        
        mainTitleLabel.text = item.bookmarkName
        mainDescriptionLabel.text = item.bookmarkDescription
        
    }
    
}
