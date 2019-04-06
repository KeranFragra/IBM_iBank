//
//  BaseUICollectionViewCell.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class BaseUICollectioViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "\(BaseUICollectioViewCell.self)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() { }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = true
    }
}
