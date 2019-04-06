//
//  LoginView.swift
//  IBM iBank
//
//  Created by Promoth on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit


private struct LoginViewFields {
    static let strLogin  = "Login"
}


class LoginView : UIView {
    
    var txtEmailId  : UITextField?
    var txtPin : UITextField?
   // var btnLogin  : UIButton?
    
    override init(frame: CGRect) {
        super.init(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        self.backgroundColor = UIColor.white
        self.alpha = 0.0
        allocFields()
    }
    
    private func allocFields(){
        
        txtEmailId = UITextField()
        txtEmailId?.placeholder = "Enter User ID"
        txtEmailId?.font = UIFont.systemFont(ofSize: 15)
        txtEmailId?.borderStyle = UITextField.BorderStyle.roundedRect
        txtEmailId?.autocorrectionType = UITextAutocorrectionType.no
        txtEmailId?.keyboardType = UIKeyboardType.default
        txtEmailId?.returnKeyType = UIReturnKeyType.done
        txtEmailId?.clearButtonMode = UITextField.ViewMode.whileEditing
        txtEmailId?.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        txtEmailId?.delegate = self as? UITextFieldDelegate
        
        txtPin = UITextField()
        txtPin?.placeholder = "Enter PIN"
        txtPin?.font = UIFont.systemFont(ofSize: 15)
        txtPin?.borderStyle = UITextField.BorderStyle.roundedRect
        txtPin?.autocorrectionType = UITextAutocorrectionType.no
        txtPin?.keyboardType = UIKeyboardType.default
        txtPin?.returnKeyType = UIReturnKeyType.done
        txtPin?.clearButtonMode = UITextField.ViewMode.whileEditing
        txtPin?.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        txtPin?.delegate = self as? UITextFieldDelegate
        
//        btnLogin = UIButton.init()
//        btnLogin?.setTitle(LoginViewFields.strLogin, for: .normal)
//        btnLogin?.backgroundColor = .blue
//        btnLogin?.layer.cornerRadius = 5.0
        
        self.addSubview(txtEmailId!)
        self.addSubview(txtPin!)
       // self.addSubview(btnLogin!)
        frameForFileds()
    }
    
    private func frameForFileds(){
        var x ,y ,width ,height :CGFloat
        
        x      = 15
        y = 64 + 10;
      //  y      = UIScreen.main.bounds.height/2 - 90
        width  = UIScreen.main.bounds.width - x * 2
      //  height = (MOBILE_TYPE.lowercased() == "ipad") ? 55 : 40
        height = 40;
        txtEmailId?.frame = CGRect(x: x, y: y, width: width, height: height)
        
        x      = 15
        y      = 15 + (txtEmailId?.frame.maxY)!
        width  = UIScreen.main.bounds.width - x * 2
        height = 40;
        txtPin?.frame = CGRect(x: x, y: y, width: width, height: height)
        
        
//        width  = UIScreen.main.bounds.width - x * 2
//        height = 40
//        x      = 15
//        y = UIScreen.main.bounds.height - 40 - 40;
//        btnLogin?.frame = CGRect(x: x, y: y, width: width, height: height)
//        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




















    

