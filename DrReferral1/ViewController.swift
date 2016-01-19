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

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.navigationBarHidden = true
		
		
				
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(animated: Bool) {
		
		self.navigationController?.navigationBarHidden = true
	}

	@IBAction func showContactUsAlert(sender: AnyObject) {

		let alert = UIAlertController(title: "Contact Us", message: "Call us, email us, or visit us on our webpage.", preferredStyle: UIAlertControllerStyle.ActionSheet)
		
		alert.addAction(UIAlertAction(title: "Visit our Website",
			style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
				UIApplication.sharedApplication().openURL(NSURL(string: "http://www.nah.org")!)
				return
		}))
		
		alert.addAction(UIAlertAction(title: "702-426-0264",
			style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
				
				if let phoneCallURL:NSURL = NSURL(string: "tel://7024260264") {
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

