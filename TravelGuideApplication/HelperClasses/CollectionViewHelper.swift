//
//  CollectionViewHelper.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import Foundation
import UIKit

class CollectionViewHelper:NSObject {
    var collectionView:UICollectionView?
    var viewController:UIViewController?
    var items:[Any] = []
    var navigationController:UINavigationController?
    
    init(_ collectionView:UICollectionView, _ viewController:UIViewController, _ items:[Any], _ navigationController:UINavigationController){
        super.init()
        self.collectionView = collectionView
        self.viewController = viewController
        self.items = items
        self.navigationController = navigationController
        configureCollectionView()
    }
    
    private func configureCollectionView(){
        collectionView?.register(.init(nibName: TopArticlesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopArticlesCollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}


extension CollectionViewHelper:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopArticlesCollectionViewCell.identifier, for: indexPath) as! TopArticlesCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension CollectionViewHelper:UICollectionViewDelegateFlowLayout {
    
}
