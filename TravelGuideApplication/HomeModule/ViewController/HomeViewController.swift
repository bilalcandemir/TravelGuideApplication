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
    
    // This screen's navigation bar doesen't show but in the second screen, navigation bar will be show
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        super.viewWillDisappear(animated)
    }
    
    func createCollectionView(){
        collectionHelper = .init(articlesCollectionView, self, viewModel.articleModel.articlesData, self.navigationController!)
    }
    
    @IBAction func flightsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FlightsHotels", bundle: nil)
        let flightsViewController = storyboard.instantiateViewController(withIdentifier: "FlightsHotelsViewController") as! FlightsHotelsViewController
        flightsViewController.selectedTitle = "Flights"
        flightsViewController.viewModel.loadDataForFlights()
        self.navigationController?.pushViewController(flightsViewController, animated: true)
    }
    
    @IBAction func hotelsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FlightsHotels", bundle: nil)
        let hotelsViewController = storyboard.instantiateViewController(withIdentifier: "FlightsHotelsViewController") as! FlightsHotelsViewController
        hotelsViewController.selectedTitle = "Hotels"
        hotelsViewController.viewModel.loadDataForHotels()
        self.navigationController?.pushViewController(hotelsViewController, animated: true)
    }
}
