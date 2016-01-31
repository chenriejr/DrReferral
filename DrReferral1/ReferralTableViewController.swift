//
//  ReferralTableViewController.swift
//  DrReferral1
//
//  Created by Cal Henrie on 12/21/15.
//  Copyright © 2015 calhenrie. All rights reserved.
//

import UIKit
import Parse


class ReferralTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var referrerName: UILabel!
	@IBOutlet weak var location: UILabel!
	@IBOutlet weak var patientPhoneTextField: UITextField!
	@IBOutlet weak var referrerNameTextField: UITextField!
	@IBOutlet weak var room: UILabel!
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var roomTextField: UITextField!
	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var NPI: UILabel!
	@IBOutlet weak var referrerPhone: UILabel!
	@IBOutlet weak var referrerEmail: UILabel!
	@IBOutlet weak var familyPhone: UILabel!
	@IBOutlet weak var familyName: UILabel!
	@IBOutlet weak var phone: UILabel!
	@IBOutlet weak var firstName: UILabel!
	@IBOutlet weak var lastName: UILabel!
	@IBOutlet weak var familyNameTextField: UITextField!
	@IBOutlet weak var NPITextField: UITextField!
	@IBOutlet weak var referrerPhoneTextField: UITextField!
	@IBOutlet weak var referrerEmailTextField: UITextField!
	@IBOutlet weak var comments: UITextView!
	@IBOutlet weak var referralImage: UIImageView!
	
	let imagePicker = UIImagePickerController()
	
	let profileNameKeyConstant = "profileNameKey"
	let profilePhoneKeyConstant = "profilePhoneKey"
	let profileEmailKeyConstant = "profileEmailKey"
	let profileNpiKeyConstant = "profileNpiKey"

	
	let section = ["Patient Information", "Family Contact", "Referrer"]
	let items = [["First Name", "Last Name", "Location","Room","Phone","Email"], ["Name", "Phone"], ["Name", "Phone ", "Email", "NPI"]]


	@IBOutlet weak var familyPhoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.imagePicker.delegate = self
		self.navigationController?.navigationBarHidden = false
		
		self.firstName.text = "First Name"
		self.lastName.text = "Last Name"
		self.room.text = "Room"
		self.location.text = "Location"
		self.phone.text = "Phone"
		
		self.familyName.text = "Name"
		self.familyPhone.text = "Phone"
		
		self.referrerName.text = "Name"
		self.referrerPhone.text = "Phone"
		self.referrerEmail.text = "Email"
		self.NPI.text = "NPI"
		
		let defaults = NSUserDefaults.standardUserDefaults()
		if let name = defaults.stringForKey(profileNameKeyConstant)
		{
			referrerNameTextField.text = name
		}
		if let phone = defaults.stringForKey(profilePhoneKeyConstant)
		{
			referrerPhoneTextField.text = phone
		}
		if let email = defaults.stringForKey(profileEmailKeyConstant)
		{
			self.referrerEmailTextField.text = email
		}
		if let npi = defaults.stringForKey(profileNpiKeyConstant)
		{
			self.NPITextField.text = npi
		}



        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		
		return self.section[section]
	}
	
	@IBAction func saveReferral(sender:AnyObject){
		
		let imageData = UIImageJPEGRepresentation(referralImage.image!,1.0 )
		let referralImageFile = PFFile(name:"referralImage", data:imageData!)

	
		ReferralController.sharedInstance.saveReferral (referralImageFile!, NPI : NPITextField.text!, referrerName : referrerNameTextField.text!, referrerPhone: referrerPhoneTextField.text!, referrerEmail: referrerEmailTextField.text!, room : roomTextField.text!,familyPhone: familyPhoneTextField.text!, familyName : familyNameTextField.text!, phone: familyPhoneTextField.text!, location : locationTextField.text!, firstName : firstNameTextField.text!, comments: comments.text!)
		
		
		let firstName = firstNameTextField.text!
		let lastName = lastNameTextField.text!
		let location = locationTextField.text!
		let room = roomTextField.text!
		let phone = patientPhoneTextField.text!
		let familyName = familyNameTextField.text!
		let familyPhone = familyPhoneTextField.text!
		let referrerName = referrerNameTextField.text!
		let referrerPhone = referrerPhoneTextField.text!
		let referrerEmail = referrerEmailTextField.text!
		let npi = NPITextField.text!
		let comment = comments.text!
		
		let referral =  "Patient Information- " + " " + "First Name: " + firstName + "  " + "Last Name: "+lastName + "  " + "Location:" + location + "  " + "Room Number: " + room + "  " + "Phone Number: "+phone + "  " + "Family Information- " + "Family Name: " + familyName + "  " + "Family Phone: " + familyPhone + "  " + "Referrer Information- " + "Referrer Name: " + referrerName + "  "  + "Referrer Phone: " + referrerPhone + "  " + "Referrer Email: " + referrerEmail + "  " + "NPI: "  +   npi + " " + "Comments:" + comment
		
		print(referral)

	
	
	PFCloud.callFunctionInBackground("sendMail", withParameters:[ "toEmail":"calhenrie@icloud.com","fromEmail":"cal@aisleup.com","text":referral,"subject":"Lead from Dr Referral"]) { ( response:AnyObject?,error :NSError?) -> Void in
	if error == nil {
	print("mail sent")
	}
	if (error != nil) {
	print(error)
	}
	}

	}

	@IBAction func addPhoto(sender: AnyObject) {
		
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .Camera
		
		presentViewController(imagePicker, animated: true, completion: nil)
		
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
		
		let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
		
		    referralImage.contentMode = .ScaleAspectFit
			referralImage.image = pickedImage
			
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		
		dismissViewControllerAnimated(true, completion: nil)
	}

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
