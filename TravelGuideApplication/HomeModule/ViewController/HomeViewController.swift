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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowToView()
        
        // Create collection View in view model
    }
    @IBAction func flightsButtonPressed(_ sender: Any) {
        
    }
    
}
