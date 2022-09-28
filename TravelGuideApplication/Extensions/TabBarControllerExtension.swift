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
        
        tabBar.selectionIndicatorImage = UIImage(named: "rectangle")
        tabBar.layer.shadowColor = UIColor(named: "tabBarShadow")?.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 10
    }
    
    override func viewDidLayoutSubviews() {
        if UIScreen.main.bounds.size.height > 700 {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
        
    }

}


