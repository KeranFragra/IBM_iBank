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
    
    func setupMainButton() {
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.setTitle("NEXT", for: .normal)
        mainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        mainButton.backgroundColor = Styles.Color.BLUE
        mainButton.layer.cornerRadius = 10
        mainButton.tintColor = .white
        view.addSubview(mainButton)
        
        // Constraints
        activate(constraint: mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25))
        activate(constraint: mainButton.heightAnchor.constraint(equalToConstant: 60))
        activate(constraint: mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        activate(constraint: mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
