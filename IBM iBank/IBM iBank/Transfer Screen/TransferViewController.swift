//
//  TransferViewController.swift
//  IBM iBank
//
//  Created by Promoth on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class TransferViewController: UIViewController, UITabBarDelegate {
    
    var recevedString: String?
    var concateString: String?
    
    var lblWelcome  : UILabel?
    var txtViewGoodMorn : UITextView?
    var btnTrans : UIButton?
    lazy var tabBar: UITabBar! = UITabBar()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        prepareView()
        prepareTabBar()
        // Do any additional setup after loading the view.
    }
    
    func prepareView() {
        
        lblWelcome = UILabel()
        
        lblWelcome?.text = "Welcome " + recevedString!
        lblWelcome?.textAlignment = .left
        lblWelcome?.textColor     = UIColor.darkGray
        
        txtViewGoodMorn = UITextView()
        self.automaticallyAdjustsScrollViewInsets = false
        
        txtViewGoodMorn!.center = self.view.center
        txtViewGoodMorn!.textAlignment = NSTextAlignment.center
        txtViewGoodMorn!.textColor = UIColor.white
        txtViewGoodMorn!.text = "Good Morning 8AM 24'C - Its Raining, please take your umbrella"
        txtViewGoodMorn!.layer.cornerRadius = 5.0
        txtViewGoodMorn!.backgroundColor = UIColor.lightGray

        
        btnTrans = UIButton.init()
        btnTrans?.setTitle("Make A Transfer", for: .normal)
        btnTrans?.backgroundColor = .blue
        btnTrans?.layer.cornerRadius = 5.0
        btnTrans?.addTarget(self, action: #selector(transEvent), for: .touchUpInside)
        
        
        self.view.addSubview(lblWelcome!)
        self.view.addSubview(txtViewGoodMorn!)
        self.view.addSubview(btnTrans!)
        frameForView()
    }
    
    /* Setup TabBar */
    
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

    
    func frameForView() {
        var x ,y ,width ,height :CGFloat
        
        x      = 15
        y = 64 + 10;
        width  = UIScreen.main.bounds.width - x * 2
        height = 40;
        lblWelcome?.frame = CGRect(x: x, y: y, width: width, height: height)
        
        x      = 15
        y      = 40 + (lblWelcome?.frame.maxY)!
        width  = UIScreen.main.bounds.width - x * 2
        height = 80;
        txtViewGoodMorn?.frame = CGRect(x: x, y: y, width: width, height: height)
        
        width  = UIScreen.main.bounds.width - x * 2
        height = 40
        x      = 15
        y = UIScreen.main.bounds.height - 45 - 80;
        btnTrans?.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    @objc func transEvent(){
        
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = true
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // do something
        switch item.tag {
        case 0:
            print("zero")
            let newViewController = HistoryViewController()
            // newViewController.recevedString  = viewLogin?.txtEmailId?.text
            self.navigationController?.pushViewController(newViewController, animated: true)
        default:
            print("default")
            
            let newViewController = HistoryViewController()
           // newViewController.recevedString  = viewLogin?.txtEmailId?.text
            self.navigationController?.pushViewController(newViewController, animated: true)
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
