//
//  HistoryViewController.swift
//  IBM iBank
//
//  Created by Promoth on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITabBarDelegate {
    
    lazy var tabBar: UITabBar! = UITabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        prepareTabBar()
        // Do any additional setup after loading the view.
    }
    
    func prepareTabBar() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        let item1 = UITabBarItem(title: "TRANSFER", image: nil, selectedImage: nil)
        item1.tag = 0
        let item2 = UITabBarItem(title: "HISTORY", image: nil, selectedImage: nil)
        item2.tag = 1
        tabBar.delegate = self
        
        tabBar.items = [item1, item2]
        view.addSubview(tabBar)
        
        //
        activate(constraint: tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0))
        activate(constraint: tabBar.heightAnchor.constraint(equalToConstant: 45))
        activate(constraint: tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0))
        activate(constraint: tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0))
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = true
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // do something
        switch item.tag {
        case 0:
            print("zero")
        default:
            print("default")
            //dismiss(animated: true, completion: nil)
            navigationController?.popViewController(animated: true)
        }
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
