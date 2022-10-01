//
//  DetailViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est vel odio elementum non id venenatis, elementum. Enim augue velit tristique eu viverra. Massa."
    }
}
