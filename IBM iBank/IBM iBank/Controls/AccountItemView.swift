//
//  AccountItemView.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class AccountItemView: BaseUIView {
    
    //MARK: - Outlets
    private lazy var titleLabel: UILabel! = UILabel()
    private lazy var descriptionTextField: UITextField! = UITextField()
    private lazy var accessoryImageView: UIImageView! = UIImageView()
    private lazy var separatorView: UIView! = UIView()
    
    var hasAccessoryImageView: Bool = false {
        didSet {
            accessoryImageView.isHidden = !hasAccessoryImageView
        }
    }
    
    var isDescriptionEditable: Bool = false {
        didSet {
            descriptionTextField.isEnabled = isDescriptionEditable
        }
    }
    
    var model: AccountItemModel? = nil {
        didSet {
            guard let model = model else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.titleLabel.text = model.title
                self?.descriptionTextField.text = model.descriptionValue
                self?.hasAccessoryImageView = model.hasAccessory
                self?.isDescriptionEditable = model.isDescriptionEditable
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = Styles.Color.BLUE
        setupTitleLabel()
        setupDescriptionTextField()
        setupAccessoryImageView()
        setupSeparatorView()
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .white
        addSubview(titleLabel)
        
        // Constraints
        activate(constraint: titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        activate(constraint: titleLabel.heightAnchor.constraint(equalToConstant: 23))
        activate(constraint: titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    private func setupDescriptionTextField() {
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.font = UIFont.systemFont(ofSize: 22)
        descriptionTextField.textColor = .white
        addSubview(descriptionTextField)
        
        // Constraints
        activate(constraint: descriptionTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5))
        activate(constraint: descriptionTextField.heightAnchor.constraint(equalToConstant: 23))
        activate(constraint: descriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: descriptionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
    
    private func setupAccessoryImageView() {
        accessoryImageView.translatesAutoresizingMaskIntoConstraints = false
        accessoryImageView.image = #imageLiteral(resourceName: "accessory_next").withRenderingMode(.alwaysTemplate)
        accessoryImageView.tintColor = .white
        accessoryImageView.contentMode = .scaleAspectFit
        addSubview(accessoryImageView)
        
        // Constraints
        activate(constraint: accessoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor))
        activate(constraint: accessoryImageView.heightAnchor.constraint(equalToConstant: 21))
        activate(constraint: accessoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15))
        activate(constraint: accessoryImageView.widthAnchor.constraint(equalToConstant: 10.5))
    }
    
    private func setupSeparatorView() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .lightGray
        addSubview(separatorView)
        
        // Constraints
        activate(constraint: separatorView.bottomAnchor.constraint(equalTo: bottomAnchor))
        activate(constraint: separatorView.heightAnchor.constraint(equalToConstant: 0.5))
        activate(constraint: separatorView.leadingAnchor.constraint(equalTo: leadingAnchor))
        activate(constraint: separatorView.trailingAnchor.constraint(equalTo: trailingAnchor))
    }
}
