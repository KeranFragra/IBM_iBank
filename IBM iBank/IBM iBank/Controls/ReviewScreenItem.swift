//
//  ReviewScreenItem.swift
//  IBM iBank
//
//  Created by Keran on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class ReviewScreenItem: UIView {

    lazy var firstLabel : UILabel! = UILabel()
    lazy var secondLabel : UILabel! = UILabel()
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        initViews()
        addViews()
        addConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initViews(){
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "First Label"
        firstLabel.font = UIFont.systemFont(ofSize: 10)
        firstLabel.textColor = UIColor.black
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "Second Label"
        secondLabel.font = UIFont.systemFont(ofSize: 15)
        secondLabel.textColor = UIColor.black
    }
    
    func addViews() {
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = isActive
    }
    
    func addConstraint() {
        
        // Constraints for First Label
        activate(constraint: firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        activate(constraint: firstLabel.heightAnchor.constraint(equalToConstant: 20))
        activate(constraint: firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
        
        //Constraint for Second Label
        activate(constraint: secondLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30))
        activate(constraint: secondLabel.heightAnchor.constraint(equalToConstant: 20))
        activate(constraint: secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        activate(constraint: secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10))
    }
}
