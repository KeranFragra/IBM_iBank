//
//  SearchItemHeaderCell.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class SearchItemHeaderView: UICollectionReusableView {
    
    class var identifier: String {
        return "\(SearchItemHeaderView.self)"
    }
    
    class var preferredHeight: CGFloat {
        return 40
    }
    
    //MARK: - Outlets
    private lazy var titleLabel: UILabel! = UILabel()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        addSubview(titleLabel)
        
        // Constraints
        activate(constraint: titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        activate(constraint: titleLabel.heightAnchor.constraint(equalToConstant: 45))
        activate(constraint: titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = isActive
    }
}
