//
//  CompletionScreenViewController.swift
//  IBM iBank
//
//  Created by HERSOM on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class CompletionScreenViewController: UIViewController {

    lazy var models: [ReviewItemModel] = [ReviewItemModel]()
    let makeAnotherTransactionButton = UIButton(type: UIButton.ButtonType.system) as UIButton
    let goToHomeButton = UIButton(type: UIButton.ButtonType.system) as UIButton
    let shareDetailsButton = UIButton(type: UIButton.ButtonType.system) as UIButton
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompletionItemDummyData()
        setupCollectionView()
        initShareDetailsButton()
        initGoToHomeButton()
        initAnotherTrasactionButton()

        
        view.backgroundColor = .white
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        // Constraints for the Collection View
        activate(constraint: collectionView.topAnchor.constraint(equalTo: view.topAnchor))
        activate(constraint: collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        activate(constraint: collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        activate(constraint: collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        
        collectionView.delegate = self 
        collectionView.dataSource = self
        
        
        collectionView.register(ReviewItemCollectionViewCell.self, forCellWithReuseIdentifier: ReviewItemCollectionViewCell.identifier)
    }
    
    func activate(constraint: NSLayoutConstraint, isActive: Bool = true) {
        constraint.isActive = isActive
    }
    
    //TO DO : Remove this when there is data from Json
    private func setCompletionItemDummyData() {
        var model = ReviewItemModel(title: "Source Account", descriptionValue: "My Saving Account (123-456-789)")
        models.append(model)
        
        model = ReviewItemModel(title: "Destination Account", descriptionValue: "Saving Account (123-456-789)")
        models.append(model)
        
        model = ReviewItemModel(title: "Sending Amount", descriptionValue: "SGD 1000")
        models.append(model)
        
        model = ReviewItemModel(title: "Receiving Amount", descriptionValue: "INR 50,780.00")
        models.append(model)
        
        model = ReviewItemModel(title: "Reference No.", descriptionValue: "REF2019ABC")
        models.append(model)
    }

}

extension CompletionScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewItemCollectionViewCell.identifier, for: indexPath) as! ReviewItemCollectionViewCell
        cell.reviewView.firstLabel.text = models[indexPath.item].title
        cell.reviewView.secondLabel.text = models[indexPath.item].descriptionValue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        _ = collectionView.contentInset
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func initShareDetailsButton(){
        //Constraints for Share Details Button
        shareDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shareDetailsButton)
        activate(constraint: shareDetailsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20))
        activate(constraint: shareDetailsButton.heightAnchor.constraint(equalToConstant: 60))
        activate(constraint: shareDetailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        activate(constraint: shareDetailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        
        shareDetailsButton.backgroundColor = UIColor.lightGray
        shareDetailsButton.setTitle("SHARE DETAILS", for: UIControl.State.normal)
        shareDetailsButton.tintColor = UIColor.black
        shareDetailsButton.addTarget(self, action: #selector(self.shareDetailsButtonAction(_:)), for: .touchUpInside)
        
        
    }
    
    //This function is called when Share Details Button is clicked
    @objc func shareDetailsButtonAction(_ sender:UIButton!)
    {
        print("anotherTransactionButtonAction tapped")
    }
    
    
    func initAnotherTrasactionButton(){
        //Constraints for Make Another Transfer Button
        makeAnotherTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(makeAnotherTransactionButton)
        
        activate(constraint: makeAnotherTransactionButton.bottomAnchor.constraint(equalTo: goToHomeButton.topAnchor, constant: -20))
        activate(constraint: makeAnotherTransactionButton.heightAnchor.constraint(equalToConstant: 60))
        activate(constraint: makeAnotherTransactionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        activate(constraint: makeAnotherTransactionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        
        
        makeAnotherTransactionButton.backgroundColor = UIColor.lightGray
        makeAnotherTransactionButton.setTitle("MAKE ANOTHER TRANSFER", for: UIControl.State.normal)
        makeAnotherTransactionButton.tintColor = UIColor.black
        makeAnotherTransactionButton.addTarget(self, action: #selector(self.anotherTransactionButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(makeAnotherTransactionButton)
        
        
    }
    
    //This Function is called when Make Another Transfer Button is clicked
    @objc func anotherTransactionButtonAction(_ sender:UIButton!)
    {
        print("anotherTransactionButtonAction tapped")
    }
    
    func initGoToHomeButton(){
        //Constraints for Go to Home Button
        goToHomeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goToHomeButton)
        
        activate(constraint: goToHomeButton.bottomAnchor.constraint(equalTo: shareDetailsButton.topAnchor, constant: -20))
        activate(constraint: goToHomeButton.heightAnchor.constraint(equalToConstant: 60))
        activate(constraint: goToHomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        activate(constraint: goToHomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20))
        
        goToHomeButton.backgroundColor = UIColor.lightGray
        goToHomeButton.setTitle("GO TO HOME", for: UIControl.State.normal)
        goToHomeButton.tintColor = UIColor.black
        goToHomeButton.addTarget(self, action: #selector(self.goToHomeAction(_:)), for: .touchUpInside)
        self.view.addSubview(goToHomeButton)
    }
    
    //This function is called when Go TO Home Button is clicked
    @objc func goToHomeAction(_ sender:UIButton!)
    {
        print("goToHomeAction tapped")
    }
    
}
