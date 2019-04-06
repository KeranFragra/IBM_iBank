//
//  SearchItemView.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class SearchItemView: BaseUIView {
    
    //MARK: - Outlets
    private lazy var titleLabel: UILabel! = UILabel()
    private lazy var descriptionLabel: UILabel! = UILabel()
    private lazy var valueLabel: UILabel! = UILabel()
    
    var model: SearchItemModel? = nil {
        didSet {
            guard let model = model else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.titleLabel.text = model.title
                self?.descriptionLabel.text = model.descriptionValue
                self?.valueLabel.text = model.value
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupTitleLabel()
        setupDescriptionLabel()
        setupValueLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18)

        addSubview(titleLabel)
        
        // Constraints
        activate(constraint: titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        activate(constraint: titleLabel.heightAnchor.constraint(equalToConstant: 23))
        activate(constraint: titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        addSubview(descriptionLabel)
        
        // Constraints
        activate(constraint: descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5))
        activate(constraint: descriptionLabel.heightAnchor.constraint(equalToConstant: 23))
        activate(constraint: descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    private func setupValueLabel() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont.boldSystemFont(ofSize: 18)
        valueLabel.textAlignment = .right
        addSubview(valueLabel)
        
        // Constraints
        activate(constraint: valueLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10))
        activate(constraint: valueLabel.heightAnchor.constraint(equalToConstant: 21))
        activate(constraint: valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
}
