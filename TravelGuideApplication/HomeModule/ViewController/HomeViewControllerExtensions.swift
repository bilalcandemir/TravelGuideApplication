//
//  HomeViewControllerExtensions.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation
import UIKit
extension HomeViewController {
    func addShadowToView(){
        flightsView.layer.shadowColor = UIColor.white.cgColor
        flightsView.layer.shadowOpacity = 0.7
        flightsView.layer.shadowOffset = .zero
        flightsView.layer.shadowRadius = 10
        
        hotelsView.layer.shadowColor = UIColor.white.cgColor
        hotelsView.layer.shadowOpacity = 0.7
        hotelsView.layer.shadowOffset = .zero
        hotelsView.layer.shadowRadius = 10
    }
    
    func setNavBar(){
        let backImage = UIImage(named: "backButtonIcon")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.tintColor = .black
        
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
}
