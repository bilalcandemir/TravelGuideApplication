//
//  DetailViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import UIKit
import Kingfisher

// I couldn't MVVM architecture in this class
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
    var bookmarkStatus:Bool!
    
    var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = 10
        detailImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        // First job is look to core data
        checkBookmarkStatus()
        setData()
    }
    
    // This function goes to view model and check the core data item is there or not, after that change the status value
    func checkBookmarkStatus(){
        if detailViewModel.checkBookmarkStatus(selectedCategory ?? "HOTEL", itemId ?? 0, itemDate ?? "") {
            addButton.setTitle("Remove Bookmark", for: .normal)
            bookmarkStatus = true
        }
        else {
            addButton.setTitle("Add Bookmark", for: .normal)
            bookmarkStatus = false
        }
    }
    
    // Custom back button action
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Bookmark Add or Remove Button Pressed
    @IBAction func bookmarkButtonPressed(_ sender: Any) {
        // If bookmark status is true, then delete the object inside of core data
        if bookmarkStatus {
            detailViewModel.removeBookmark()
            checkBookmarkStatus()
        }
        // If bookmark status is false, add object to core data
        else {
            if selectedCategory == "HOTEL"{
                detailViewModel.addToBookmark(itemId ?? 0, titleText ?? "", itemDate ?? "", descriptionText ?? "", imageURL ?? "", .hotel)
            }
            else if selectedCategory == "FLIGHT" {
                detailViewModel.addToBookmark(itemId ?? 0, titleText ?? "", itemDate ?? "", descriptionText ?? "", imageURL ?? "", .flight)
            }
            else {
                detailViewModel.addToBookmark(itemId ?? 0, titleText ?? "", itemDate ?? "", descriptionText ?? "", imageURL ?? "", .article)
            }
            // After add and remove operations check bookmark core data again and change the button names
            checkBookmarkStatus()
        }
    }
    
    // Set data
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
        
        else {
            detailImageView.contentMode = .scaleAspectFill
            detailImageView.image = UIImage(named: imageURL ?? "")
        }
        
        titleLabel.text = titleText ?? ""
        descriptionLabel.text = descriptionText ?? ""
        categoryLabel.text = selectedCategory ?? ""
    }
    
    // Set data flights this item come from previous view controller
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
    
    // Set data hotels this item come from previous view controller
    func setDataForHotels(_ item:HotelsCellModel){
        selectedCategory = "HOTEL"
        
        titleText = item.hotelName
        descriptionText = "\(item.hotelAddress) - \(item.hotelRating) - \(item.hotelPrice)"
        imageURL = item.hotelImageURL
        itemId = item.hotelId
        itemDate = item.hotelName
    }
    
    // Set data articles this item come from previous view controller
    func setDataForArticle(_ item:Article){
        selectedCategory = "ARTICLE"
        titleText = item.articleTitle
        descriptionText = item.description
        imageURL = item.imageName
        // Set the date as String
        let time = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        let formatteddate = formatter.string(from: time)
        itemDate = formatteddate
        itemId = item.itemId
    }
    
    // Set data bookmark this item come from previous view controller
    func setDataForBookmark(_ item:BookmarkCoreData){
        selectedCategory = item.bookmarkType
        titleText = item.bookmarkName
        descriptionText = item.bookmarkDescription
        imageURL = item.bookmarkImageURL
        itemId = Int(item.bookmarkId)
        itemDate = item.bookmarkDate
    }
}
