//
//  InputScreenViewer+Views.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

extension InputScreenViewer {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        // Constraints
        activate(constraint: collectionView.topAnchor.constraint(equalTo: view.topAnchor))
        activate(constraint: collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        activate(constraint: collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        activate(constraint: collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        //
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //
        collectionView.register(AccountItemCell.self, forCellWithReuseIdentifier: AccountItemCell.identifier)
        collectionView.register(BaseUICollectioViewCell.self, forCellWithReuseIdentifier: BaseUICollectioViewCell.identifier)
        //Add one more
    }
}
