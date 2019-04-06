//
//  LoginViewController.swift
//  IBM iBank
//
//  Created by Promoth on 6/4/19.
//  Copyright © 2019 Joemar Brillo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var viewLogin : LoginView?
    
    var btnLogin  : UIButton?

//    var activityIndicator : ActivityIndicator?
    
    /* ----------------- VIEW DID LOAD ------------------ */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
      //  self.hideKeyboardWhenTappedAround()
        prepareView()
    }
    
    /* ----------------- PREPARE VIEW ------------------ */
    
    func prepareView() {
        
        print("prepare view call")
        viewLogin = LoginView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewLogin?.txtEmailId?.delegate  = self as? UITextFieldDelegate
        viewLogin?.txtPin?.delegate = self as? UITextFieldDelegate
        
        btnLogin = UIButton.init()
        btnLogin?.setTitle("Login", for: .normal)
        btnLogin?.backgroundColor = .blue
        btnLogin?.layer.cornerRadius = 5.0
        btnLogin?.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        
      //  viewLogin?.btnLogin?.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        viewLogin?.backgroundColor = .white
        
        animateLogin()
        
        self.view.addSubview(viewLogin!)
        viewLogin! .addSubview(btnLogin!)
    }
    
    
    
    func animateLogin() {
        var x ,y ,width ,height :CGFloat

        x = 15
        width  = UIScreen.main.bounds.width - x * 2
        height = 40
        x      = 15
        y = UIScreen.main.bounds.height - 40 - 40;
        btnLogin?.frame = CGRect(x: x, y: y, width: width, height: height)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.viewLogin?.alpha = 1.0
        }, completion: nil)
    }
    
    
    @objc func loginEvent() {
        
        if (viewLogin?.txtEmailId?.text?.isEmpty)! || (viewLogin?.txtPin?.text?.isEmpty)!{
            let alert = UIAlertController(title: "Alert", message: "Plese Enter User ID and Pin", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            let newViewController = TransferViewController()
            newViewController.recevedString  = viewLogin?.txtEmailId?.text
            self.navigationController?.pushViewController(newViewController, animated: true)
        }

        
       /* if viewLogin?.txtEmailId?.text != nil{
            let newViewController = TransferViewController()
            newViewController.recevedString  = viewLogin?.txtEmailId?.text
            self.navigationController?.pushViewController(newViewController, animated: true)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Plese Enter User ID", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }*/
        
        
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
