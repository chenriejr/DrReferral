//
//  LogInViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 1/26/16.
//  Copyright © 2016 calhenrie. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class LogInViewController: UIViewController, PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate {

	var logInViewController = PFLogInViewController()
	var signUpViewController = PFSignUpViewController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(animated: Bool) {
		
		super.viewDidAppear(animated)
		
		if (PFUser.currentUser() == nil){
			     self.logInViewController.fields = [PFLogInFields.UsernameAndPassword, PFLogInFields.SignUpButton,PFLogInFields.PasswordForgotten,PFLogInFields.SignUpButton,PFLogInFields.DismissButton, PFLogInFields.LogInButton]
			
			var logInLogoTilte = UILabel()
			logInLogoTilte.text = "Dr. Referral"
			self.logInViewController.logInView?.logo = logInLogoTilte
			
			self.logInViewController.delegate = self
			
			var signUpLogoTilte = UILabel()
			signUpLogoTilte.text = "Dr. Referral"
			self.signUpViewController.signUpView?.logo = logInLogoTilte
			
			self.logInViewController.signUpController = self.signUpViewController
			
			self.signUpViewController.delegate = self
		}
	}
	
	//Mark: - LogInViewcontroller Delegate Methods
	
	func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
		
		if (!username.isEmpty || !password.isEmpty){
			return true
		}else{
			return false
			}
	}
	
	func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
		
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
		
		print("Failed To Log In")
	}
	
//	func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
//		<#code#>
//	}
	
	//Mark: - SignUpVeiwController Delegate Methods
	//
	//	func signUpViewController(signUpController: PFSignUpViewController, shouldBeginSignUp info: [String : String]) -> Bool {
	//		<#code#>
	//	}
	
	func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
		
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
		
		print("User Failed To Sign Up")
	}
	
	func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
		
		print("User Did Cancel Sign Up")
	}
//Mark: - Actions
	
	@IBAction func simple(sender: AnyObject) {
		
		self.presentViewController(logInViewController, animated: true) { () -> Void in
			print("success")
		}
		
	}
	@IBAction func custom(sender: AnyObject) {
		
		performSegueWithIdentifier("logIn", sender: self)
	}
	@IBAction func logOut(sender: AnyObject) {
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
