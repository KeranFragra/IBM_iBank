//
//  InputScreenViewer.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class InputScreenViewer: BaseUIViewController {
    
    //MARK: - Outlets
    var collectionView: UICollectionView!
    
    let ROW_COUNT = 4 //TODO: Make 6 when ui is ready.
    
    lazy var models: [AccountItemModel] = [AccountItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Setup dummy data
        prepareDummyData()
        
        setupCollectionView()
    }
    
    private func prepareDummyData() {
        var model = AccountItemModel(title: "Source Account", descriptionValue: "My Saving Account (123-456-789)", hasAccessory: true, isDescriptionEditable: false)
        models.append(model)
        
        model = AccountItemModel(title: "Destination Account", descriptionValue: "Saving Account (123-456-789)", hasAccessory: true, isDescriptionEditable: false)
        models.append(model)
        
        model = AccountItemModel(title: "Sending Amount", descriptionValue: "SGD 1000", hasAccessory: false, isDescriptionEditable: true)
        models.append(model)
        
        model = AccountItemModel(title: "Receiving Amount", descriptionValue: "INR 50,780.00", hasAccessory: false, isDescriptionEditable: true)
        models.append(model)
    }
}
