//
//  referral.swift
//  DrReferral1
//
//  Created by Cal Henrie on 12/22/15.
//  Copyright © 2015 calhenrie. All rights reserved.
//

import UIKit
import Parse

class Referral : PFObject, PFSubclassing {
	// string bc force unwrap int
	@NSManaged var identifier : NSString?
	//
	@NSManaged var NPI : String?
	@NSManaged var referrerName : String?
	@NSManaged var referrerPhone: String?
	@NSManaged var referrerEmail : String?
	@NSManaged var room : String?
	@NSManaged var familyPhone: String?
	@NSManaged var familyName : String?
	@NSManaged var phone: String?
	@NSManaged var location : String?
	@NSManaged var firstName : String?
	
	
	static func parseClassName() -> String {
		return "Referral"
	}
	
}