//
//  ForgotPasswordViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 1/27/16.
//  Copyright © 2016 calhenrie. All rights reserved.
//

import UIKit
import Parse 

class ForgotPasswordViewController: UIViewController {
	
	@IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "tap:")
		view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBarHidden = false
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func passwordReset(sender: AnyObject) {
		let email = self.emailField.text
		let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
		
		// Send a request to reset a password
		PFUser.requestPasswordResetForEmailInBackground(finalEmail)
		
		let alert = UIAlertController (title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + finalEmail + ".", preferredStyle: UIAlertControllerStyle.Alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	func tap(gesture: UITapGestureRecognizer) {
		self.emailField.resignFirstResponder()
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
