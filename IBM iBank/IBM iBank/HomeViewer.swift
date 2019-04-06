//
//  HomeViewer.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

/// The main/home screen for the app.
class HomeViewer: BaseUIViewController {
    
    var testHitButton: UIButton! = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "IBM iBank"
        
        setupTestHitButton()
    }
    
    func setupTestHitButton() {
        testHitButton.translatesAutoresizingMaskIntoConstraints = false
        testHitButton.setTitle("Hit Me!", for: .normal)
        view.addSubview(testHitButton)
        
        // Constraints
        activate(constraint: testHitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        activate(constraint: testHitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        activate(constraint: testHitButton.widthAnchor.constraint(equalToConstant: 100))
        
        testHitButton.addTarget(self, action: #selector(testHitButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    func testHitButtonAction(_ sender: UIButton) {
        let inputScreenViewer = InputScreenViewer()
        show(inputScreenViewer, sender: self)
    }
}
