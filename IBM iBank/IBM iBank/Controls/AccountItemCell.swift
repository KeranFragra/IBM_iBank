//
//  AccountItemCell.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class AccountItemCell: BaseUICollectioViewCell {
    
    override class var identifier: String {
        return "\(AccountItemCell.self)"
    }
    
    //MARK: Outlets
    private lazy var itemView: AccountItemView! = AccountItemView()
    
    var model: AccountItemModel? = nil {
        didSet {
            itemView.model = model
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupItemView()
    }
    
    private func setupItemView() {
        itemView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemView)
        
        // Constraints
        activate(constraint: itemView.topAnchor.constraint(equalTo: topAnchor))
        activate(constraint: itemView.bottomAnchor.constraint(equalTo: bottomAnchor))
        activate(constraint: itemView.leadingAnchor.constraint(equalTo: leadingAnchor))
        activate(constraint: itemView.trailingAnchor.constraint(equalTo: trailingAnchor))
    }
}
