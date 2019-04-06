//
//  ReviewItemCollectionViewCell.swift
//  IBM iBank
//
//  Created by Keran on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class ReviewItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "\(ReviewItemCollectionViewCell.self)"
    
    lazy var reviewView: ReviewScreenItem! = ReviewScreenItem()
    
    lazy var models: [ReviewItemModel] = [ReviewItemModel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupreviewView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Constraints for the Review View
    private func setupreviewView() {
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(reviewView)
        
        activate(constraint: reviewView.topAnchor.constraint(equalTo:topAnchor, constant: 0))
        activate(constraint: reviewView.heightAnchor.constraint(equalToConstant: 60))
        activate(constraint: reviewView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: reviewView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = isActive
    }
}
