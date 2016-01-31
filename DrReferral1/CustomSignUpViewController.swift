//
//  CustomSignUpViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 1/26/16.
//  Copyright © 2016 calhenrie. All rights reserved.
//

import UIKit
import Parse

class CustomSignUpViewController: UIViewController {
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var userNameTextField: UITextField!
	
	var activityIndicatorView = UIActivityIndicatorView(frame:CGRectMake(0,0,150,150)) as UIActivityIndicatorView
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "tap:")
		view.addGestureRecognizer(tapGesture)
		
		self.activityIndicatorView.center = self.view.center
		self.activityIndicatorView.hidesWhenStopped = true
		self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
		
		view.addSubview(self.activityIndicatorView)
		// Do any additional setup after loading the view.
	}
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBarHidden = false
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// Mark: - Actions
	
	@IBAction func signUp(sender: AnyObject) {
		
		let userName = self.userNameTextField.text
		let password = self.passwordTextField.text
		let email = emailTextField.text
		
		if (userName?.characters.count < 5 || password?.characters.count < 5){
			
			let alert = UIAlertView(title: "Invalid username or password", message: "Username and password must contain at least 6 characters each", delegate: self, cancelButtonTitle: "OK")
			
			alert.show()
			
		}else if (email?.characters.count<7){
			
			let alert = UIAlertView(title: "Invalid email", message: "Email Adress must contain at least 7 characters ", delegate: self, cancelButtonTitle: "OK")
			
			alert.show()

		}else{
			
			self.activityIndicatorView.startAnimating()
		}
		
		var newUser = PFUser()
		
		newUser.username = userName
		newUser.password = password
		newUser.email = email
		
		newUser.signUpInBackgroundWithBlock { (succeed, error) -> Void in
			
			self.activityIndicatorView.stopAnimating()
			
			if (error != nil){
				
				let alert = UIAlertView(title: "Ohh No", message: "An error occured while signing up", delegate: self, cancelButtonTitle: "OK")
				
				alert.show()
			}else{
				
				let alert = UIAlertView(title: "Success", message: "Thank you for signing up", delegate: self, cancelButtonTitle: "OK")
				
				alert.show()
				
				self.navigationController?.popToRootViewControllerAnimated(true)
			}
		}
		
	}
	func tap(gesture: UITapGestureRecognizer) {
		self.userNameTextField.resignFirstResponder()
		self.passwordTextField.resignFirstResponder()
		self.emailTextField.resignFirstResponder()
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
