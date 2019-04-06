//
//  SearchResultsViewer+CollectionView.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

extension SearchResultsViewer: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models?.count ?? 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let model = models?[section], let items = model.items {
            return items.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsMainCell.identifier, for: indexPath) as! SearchResultsMainCell
        if let models = models, let items = models[indexPath.section].items {
            let item = items[indexPath.item]
            cell.model = item
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = collectionView.contentInset
        return CGSize(width: collectionView.frame.width - insets.left - insets.right, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchItemHeaderView.identifier, for: indexPath) as! SearchItemHeaderView
            if let models = models {
                let model = models[indexPath.section]
                headerView.title = model.title ?? ""
            }
            
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchItemHeaderView.identifier, for: indexPath)
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: SearchItemHeaderView.preferredHeight)
    }
}
