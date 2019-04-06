//
//  SearchResultModel.swift
//  IBM iBank
//
//  Created by Joemar Brillo on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import Foundation

class SearchResultModel {
    
    var title: String?
    var items: [SearchItemModel]?
    
    init() {
        self.items = [SearchItemModel]()
    }
    
    func appendItem(_ item: SearchItemModel) {
        items?.append(item)
    }
}
