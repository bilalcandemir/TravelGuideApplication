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
    var itemId:Int?
    var itemDate:String?
    
    var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = 10
        detailImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        checkBookmarkStatus()
        setData()
    }
    
    func checkBookmarkStatus(){
        if selectedCategory == "FLIGHT" {
            detailViewModel.checkBookmark(itemId ?? 0, true, itemDate)
        }
        else if selectedCategory == "HOTEL" {
            detailViewModel.checkBookmark(itemId ?? 0, false, nil)
        }
        else {
            //detailViewModel.checkBookmark(<#T##Int#>, <#T##Bool#>, <#T##String?#>)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func bookmarkButtonPressed(_ sender: Any) {
        // TODO: If bookmark is added or not
        detailViewModel.addToBookmark(itemId ?? 0, titleText ?? "", itemDate ?? "", descriptionText ?? "")
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
        
        itemId = item.flight_number
        itemDate = item.departure_at
        
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
        
        titleText = item.hotelName
        descriptionText = "\(item.hotelAddress) - \(item.hotelRating) - \(item.hotelPrice)"
        imageURL = item.hotelImageURL
        itemId = item.hotelId
        itemDate = item.hotelName
    }
    
    func setDataForArticle(_ item:Article){
        selectedCategory = "ARTICLE"
    }
    
    
}
