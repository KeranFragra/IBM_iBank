//
//  SearchResultsMainCell.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class SearchResultsMainCell: BaseUICollectioViewCell {
    
    override class var identifier: String {
        return "\(SearchResultsMainCell.self)"
    }
    
    var model: SearchItemModel? {
        didSet {
            guard let model = model else { return }
            
            searchItemView.model = model
        }
    }
    
    lazy var searchItemView: SearchItemView! = SearchItemView()
    
    override func setupViews() {
        super.setupViews()
        
        setupSearchItemView()
    }
    
    private func setupSearchItemView() {
        searchItemView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchItemView)
        
        // Constraints
        activate(constraint: searchItemView.topAnchor.constraint(equalTo: topAnchor))
        activate(constraint: searchItemView.bottomAnchor.constraint(equalTo: bottomAnchor))
        activate(constraint: searchItemView.leadingAnchor.constraint(equalTo: leadingAnchor))
        activate(constraint: searchItemView.trailingAnchor.constraint(equalTo: trailingAnchor))
    }
}
