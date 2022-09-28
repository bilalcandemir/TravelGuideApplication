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
        cell.showData(items[indexPath.row] as! Article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}

extension CollectionViewHelper:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 + 70
        
        return CGSize(width: width, height: collectionView.bounds.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0 , left: 16, bottom: 50, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
