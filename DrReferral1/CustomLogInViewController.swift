//
//  CustomLogInViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 1/26/16.
//  Copyright © 2016 calhenrie. All rights reserved.
//

import UIKit
import Parse

class CustomLogInViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBarHidden = true
	}
    //Mark: - Actions
	
	@IBAction func logIn(sender: AnyObject) {
		
		let userName = self.userNameTextField.text
		let password = self.passwordTextField.text
		
		if (userName?.characters.count < 5 || password?.characters.count < 5){
			
			let alert = UIAlertView(title: "Invalid username or password", message: "Username and password must contain at least 6 characters each", delegate: self, cancelButtonTitle: "OK")
			
			alert.show()
			
		}else{
			
			self.activityIndicatorView.startAnimating()
			
			PFUser.logInWithUsernameInBackground(userName!, password: password!, block: { (user , error ) -> Void in
				
				self.activityIndicatorView.stopAnimating()
				
				if ((user) != nil ){
					
					self.navigationController?.popToRootViewControllerAnimated(true)
					
					}else{
					let alert = UIAlertView(title: "Ohh No", message: "Invalid name and password!", delegate: self, cancelButtonTitle: "OK")

					alert.show()
				}
			})
		}
		
	}
	
	@IBAction func signUp(sender: AnyObject) {
		
		self.performSegueWithIdentifier("signUp", sender: self)
	}
	
	func tap(gesture: UITapGestureRecognizer) {
		self.userNameTextField.resignFirstResponder()
		self.passwordTextField.resignFirstResponder()
	}
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


