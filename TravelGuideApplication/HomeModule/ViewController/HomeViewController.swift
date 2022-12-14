//
//  HomeViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var flightsView: UIView!
    @IBOutlet weak var hotelsView: UIView!
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    
    var collectionHelper:CollectionViewHelper?
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        addShadowToView()
        viewModel.loadData()
        createCollectionView()
    }
    
     //This screen's navigation bar doesen't show but in the second screen, navigation bar will be show
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
    }
    // Collection view creating process using Collection View Helper Class
    func createCollectionView(){
        collectionHelper = .init(articlesCollectionView, self, viewModel.returnData(), self.navigationController!)
    }
    
    // Go to Flights
    @IBAction func flightsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FlightsHotels", bundle: nil)
        let flightsViewController = storyboard.instantiateViewController(withIdentifier: "FlightsHotelsViewController") as! FlightsHotelsViewController
        flightsViewController.selectedTitle = "Flights"
        flightsViewController.viewModel.loadDataForFlightsWithNetwork()
        self.navigationController?.pushViewController(flightsViewController, animated: true)
    }
    // Go to Hotels
    @IBAction func hotelsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FlightsHotels", bundle: nil)
        let hotelsViewController = storyboard.instantiateViewController(withIdentifier: "FlightsHotelsViewController") as! FlightsHotelsViewController
        hotelsViewController.selectedTitle = "Hotels"
        hotelsViewController.viewModel.loadDataForHotelsWithNetwork()
        self.navigationController?.pushViewController(hotelsViewController, animated: true)
    }
}
