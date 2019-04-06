//
//  InputScreenViewer+CollectionView.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

extension InputScreenViewer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Delegates and data source and flow delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ROW_COUNT
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0...3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountItemCell.identifier, for: indexPath) as! AccountItemCell
            cell.model = models[indexPath.item]
            return cell
        default:
            break
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseUICollectioViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: AccountItemCell.preferredHeight)
    }
    
}
