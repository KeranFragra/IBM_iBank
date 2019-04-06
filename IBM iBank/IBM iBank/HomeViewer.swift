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
    var testHitButton1: UIButton! = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "IBM iBank"
        
        setupTestHitButton()
        setupTestHitButton1()
    }
    
    func setupTestHitButton() {
        testHitButton.translatesAutoresizingMaskIntoConstraints = false
        testHitButton.setTitle("Transfer", for: .normal)
        view.addSubview(testHitButton)
        
        // Constraints
        activate(constraint: testHitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        activate(constraint: testHitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        activate(constraint: testHitButton.widthAnchor.constraint(equalToConstant: 100))
        
        testHitButton.addTarget(self, action: #selector(testHitButtonAction(_:)), for: .touchUpInside)
    }
    
    func setupTestHitButton1() {
        testHitButton1.translatesAutoresizingMaskIntoConstraints = false
        testHitButton1.setTitle("Search Account", for: .normal)
        view.addSubview(testHitButton1)
        
        // Constraints
        activate(constraint: testHitButton1.topAnchor.constraint(equalTo: testHitButton.bottomAnchor, constant: 10))
        activate(constraint: testHitButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        activate(constraint: testHitButton1.widthAnchor.constraint(equalToConstant: 100))
        
        testHitButton1.addTarget(self, action: #selector(testHitButtonAction1(_:)), for: .touchUpInside)
    }
    
    @objc
    func testHitButtonAction(_ sender: UIButton) {
        let viewer = InputScreenViewer()
        show(viewer, sender: self)
    }
    
    @objc
    func testHitButtonAction1(_ sender: UIButton) {
        let viewer = SearchResultsViewer()
        show(viewer, sender: self)
    }
}
