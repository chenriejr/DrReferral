//
//  ViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 12/21/15.
//  Copyright © 2015 calhenrie. All rights reserved.
//

import UIKit
import Parse
import MessageUI


class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

	@IBOutlet weak var logOutToggle: UISwitch!
	override func viewDidLoad() {
		super.viewDidLoad()
			
			
		
		
		
		
				
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(animated: Bool) {
		
		
				self.navigationController?.navigationBarHidden = true
		
		if (PFUser.currentUser() == nil) {
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				
				let viewController:CustomLogInViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! CustomLogInViewController
				self.navigationController!.showViewController(viewController, sender: self)
			})
		}
	}
	
	@IBAction func logOut(sender: AnyObject) {
		if (self.logOutToggle.on == false){
			PFUser.logOut()
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				
				let viewController:CustomLogInViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! CustomLogInViewController
				self.navigationController!.showViewController(viewController, sender: self)
		})
	 }
	}
	@IBAction func showContactUsAlert(sender: AnyObject) {

		let alert = UIAlertController(title: "Contact Us", message: "Call us, email us, or visit us on our webpage.", preferredStyle: UIAlertControllerStyle.ActionSheet)
		
		alert.addAction(UIAlertAction(title: "Visit our Website",
			style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
				UIApplication.sharedApplication().openURL(NSURL(string: "http://www.doctorreferral.com")!)
				return
		}))
		
		alert.addAction(UIAlertAction(title: "702-576-3848",
			style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
				
				if let phoneCallURL:NSURL = NSURL(string: "tel://7025763848") {
					let application:UIApplication = UIApplication.sharedApplication()
					if (application.canOpenURL(phoneCallURL)) {
						UIApplication.sharedApplication().openURL(phoneCallURL);
					}
//				UIApplication.sharedApplication().textInputContextIdentifier
				return
				}}))
		
		alert.addAction(UIAlertAction(title: "Create eMail",
			style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
				UIApplication.sharedApplication().openURL(NSURL(string: "mailto:your@emailadress.com")!)
				return
		}))
		
		alert.addAction(UIAlertAction(title: "Cancel",
			style: UIAlertActionStyle.Cancel, handler: nil))
		
		if let popoverController = alert.popoverPresentationController {
			popoverController.sourceView = sender as? UIView
			popoverController.sourceRect = sender.bounds
		}
		
		self.presentViewController(alert, animated: true, completion: nil)
		}

	
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

