//
//  ItemContactInfoViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import ContactsUI
import Firebase

class ItemContactInfoViewController: UIViewController {

    var item: Item!
    
    func updateUI() {
        labelTitle.text = "Contact Info"
        imageViewItem.image = item.itemImage
        labelItemTitle.text = item.itemTitle
        if item.notes.isEmpty {
            labelItemNotes.text = "No Notes"
        } else {
            labelItemNotes.text = item.notes
        }
        
        updateContactInfo()
    }
    
    func updateContactInfo() {
        if let contact = item.loanee {
            buttonAddContact.isHidden = true
            stackViewContactInfo.isHidden = false
            imageViewContact.image = contact.profileImage
            labelContactName.text = contact.name
            labelContactNumber.text = contact.contactNumber ?? "No Number"
            
        } else {
            buttonAddContact.isHidden = false
            stackViewContactInfo.isHidden = true
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var labelItemTitle: UILabel!
    @IBOutlet weak var labelItemNotes: UILabel!
    @IBOutlet weak var buttonAddContact: UIButton!
    @IBAction func pressAddContact(_ sender: UIButton) {
        let contactVc = CNContactPickerViewController()
        contactVc.delegate = self
        contactVc.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
        
        present(contactVc, animated: true)
    }
    
    @IBOutlet weak var stackViewContactInfo: UIStackView!
    @IBOutlet weak var imageViewContact: UIImageView!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var labelContactNumber: UILabel!
    @IBAction func pressDeleteContact(_ sender: UIButton) {
        item.assignLoanee(to: nil)
        updateContactInfo()
    }
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBAction func pressSave(_ sender: UIButton) {
        
        
        
        //validate the user has selected a contact
        guard item.loanee != nil else {
            let alertMissingContact = UIAlertController(
                title: "Saving New Item",
                message: "please select a contact that has a phone number",
                preferredStyle: .alert
            )
            
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
            alertMissingContact.addAction(dismissAction)
            
            present(alertMissingContact, animated: true)
            
            return
        }
        
        // write data to the real time database
        let userRef = Database.database().reference()
        let key = userRef.child("items").childByAutoId().key
        let newItem = ["name": item.itemTitle,
                       "notes": item.notes,
                       "loanee": item.loanee?.contactInfo.identifier]
        userRef.child("items").child(key!).setValue(newItem)
        
        // write data to storage
        uploadProfileImage(item.itemImage, key: key!) { url in
            print("url is: \(url!)")
        }
        
//        performSegue(withIdentifier: "unwind from saving new item", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func uploadProfileImage(_ image: UIImage, key: String, completion: @escaping ((_ url: URL?) -> ())) {
        let storageRef = Storage.storage().reference().child("items/\(key)")
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                storageRef.downloadURL(completion: { url, error in
                    completion(url)
                })
            } else {
                completion(nil)
            }
        }
    }
}

extension ItemContactInfoViewController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        item.assignLoanee(to: contact)
        updateContactInfo()
    }
}
