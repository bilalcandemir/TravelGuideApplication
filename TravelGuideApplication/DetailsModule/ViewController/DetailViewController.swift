//
//  DetailViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var descriptionText:String?
    var titleText:String?
    var imageURL:String?
    var selectedCategory:String?
    
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = 10
        detailImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        setData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setData(){
        if selectedCategory == "FLIGHT" {
            detailImageView.contentMode = .scaleAspectFit
            detailImageView.image = UIImage(named: imageURL ?? "")
        }
        
        else if selectedCategory == "HOTEL" {
            let url = URL(string: imageURL ?? "")
            detailImageView.contentMode = .scaleAspectFill
            detailImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = titleText ?? ""
        descriptionLabel.text = descriptionText ?? ""
        categoryLabel.text = selectedCategory ?? ""
    }
    
    func setDataForFlights(_ item:Flights){
        selectedCategory = "FLIGHT"
        
        titleText = "\(item.origin) - \(item.destination)"
        descriptionText = "\(item.flight_number) - \(item.price) - \(item.departure_at)"
        
        if item.airline == "TK" {
            imageURL = "tkLogo"
        }
        
        else if item.airline == "PC" {
            imageURL = "pcLogo"
        }
        
        else if item.airline == "XC" {
            imageURL = "xcLogo"
        }
        
        else if item.airline == "W6" {
            imageURL = "w6Logo"
        }
        
        else if item.airline == "EW" {
            imageURL = "ewLogo"
        }
        
        else {
            imageURL = "normalFlightLogo"
        }
        
    }
    
    func setDataForHotels(_ item:HotelsCellModel){
        selectedCategory = "HOTEL"
    
        descriptionText = "\(item.hotelAddress) - \(item.hotelRating) - \(item.hotelPrice)"
        titleText = item.hotelName
        imageURL = item.hotelImageURL
    }
    
    func setDataForArticle(_ item:Article){
        selectedCategory = "ARTICLE"
    }
    
    
}
