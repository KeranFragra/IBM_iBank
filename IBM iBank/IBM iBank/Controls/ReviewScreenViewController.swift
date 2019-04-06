//
//  ReviewScreenViewController.swift
//  IBM iBank
//
//  Created by Keran on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class ReviewScreenViewController: UIViewController {

    var collectionView: UICollectionView!
    
    lazy var models: [ReviewItemModel] = [ReviewItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareDummyData()
        setupCollectionView()
        
        view.backgroundColor = .white
        
    }

    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = true
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        // Constraints for the Collection View
        activate(constraint: collectionView.topAnchor.constraint(equalTo: view.topAnchor))
        activate(constraint: collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        activate(constraint: collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        activate(constraint: collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        collectionView.register(ReviewItemCollectionViewCell.self, forCellWithReuseIdentifier: ReviewItemCollectionViewCell.identifier)
    }
    
    private func prepareDummyData() {
        var model = ReviewItemModel(title: "Source Account", descriptionValue: "My Saving Account (123-456-789)")
        models.append(model)
        
        model = ReviewItemModel(title: "Destination Account", descriptionValue: "Saving Account (123-456-789)")
        models.append(model)
        
        model = ReviewItemModel(title: "Sending Amount", descriptionValue: "SGD 1000")
        models.append(model)
        
        model = ReviewItemModel(title: "Receiving Amount", descriptionValue: "INR 50,780.00")
        models.append(model)
        
        model = ReviewItemModel(title: "Service Fee: SGD 0.00", descriptionValue: "")
        models.append(model)
    }
}



extension ReviewScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewItemCollectionViewCell.identifier, for: indexPath) as! ReviewItemCollectionViewCell
        cell.reviewView.firstLabel.text = models[indexPath.item].title
        cell.reviewView.secondLabel.text = models[indexPath.item].descriptionValue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        _ = collectionView.contentInset
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
