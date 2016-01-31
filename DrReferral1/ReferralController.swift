//
//  referralController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 12/22/15.
//  Copyright © 2015 calhenrie. All rights reserved.
//

import UIKit
import Parse


class ReferralController: NSObject {
	
	class var sharedInstance: ReferralController{
		struct Static {
			static let instance: ReferralController = ReferralController()
		}
		return Static.instance
	}
	
	
	
	func saveReferral ( referralImage:PFFile, NPI : String, referrerName : String, referrerPhone: String, referrerEmail: String, room : String,familyPhone: String, familyName : String, phone: String, location : String, firstName : String, comments: String) {
		
		
		
		
		
		
		
		let referral = Referral()
		
		referral.comments = comments
		referral.referralImage = referralImage
		referral.NPI = NPI
		referral.referrerName = referrerName
		referral.referrerPhone = referrerPhone
		referral.referrerEmail = referrerEmail
		referral.room = room
		referral.familyPhone = familyPhone
		referral.familyName = familyName
		referral.phone = phone
		referral.location = location
		referral.firstName = firstName
	
		
		referral.saveInBackgroundWithBlock { (Bool, error:NSError?) -> Void in
			if error != nil {
				print(error)
				
			}else{
				
				print("Success")
			}
		}
		
		
	}
}