//
//  TabBarControllerExtension.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import UIKit

class TabBarControllerExtension: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Give shadow to tab bar and set selected items background rectangle
        tabBar.selectionIndicatorImage = UIImage(named: "rectangle")
        tabBar.layer.shadowColor = UIColor(named: "tabBarShadow")?.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 10
    }
    
    override func viewDidLayoutSubviews() {
        // Give the static size for phones which is bigger then iphone 8 size
        if UIScreen.main.bounds.size.height > 700 {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
        
    }

}


