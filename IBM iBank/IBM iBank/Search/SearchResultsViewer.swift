//
//  SearchResultsViewer.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation
import UIKit

class SearchResultsViewer: BaseUIViewController {
    
    
    //MARK: - Outlets
    var collectionView: UICollectionView!
    lazy var mainButton: UIButton! = UIButton(type: .system)
    
    var models: [SearchResultModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        prepareDummyItems()
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .white
        setupMainButton()
        setupCollectionView()
    }
    
    func prepareDummyItems() {
        models = [SearchResultModel]()
        
        // First model item
        var subItems = [SearchItemModel]()
        var subItem = SearchItemModel(title: "My Saving Account (123-456-789)", descriptionValue: "Saving Account (123-456-789)", value: "SGD 1000.00")
        subItems.append(subItem)
        
        subItem = SearchItemModel(title: "My Saving Account (123-456-7890)", descriptionValue: "Saving Account (123-456-7890)", value: "SGD 2000.00")
        subItems.append(subItem)
        
        var model = SearchResultModel()
        model.title = "Date: 06 April 2019"
        model.items = subItems
        models?.append(model)
        
        // Second model item
        subItems = [SearchItemModel]()
        subItem = SearchItemModel(title: "My Saving Account (123-456-789)", descriptionValue: "Saving Account (123-456-789)", value: "SGD 1000.00")
        subItems.append(subItem)
        
        subItem = SearchItemModel(title: "My Saving Account (123-456-789)", descriptionValue: "Saving Account (123-456-789)", value: "SGD 1000.00")
        subItems.append(subItem)
        
        model = SearchResultModel()
        model.title = "Date: 05 April 2019"
        model.items = subItems
        models?.append(model)
        
        // Reload the items
        collectionView.reloadData()
    }
}
