//
//  ReceiptViewController.swift
//  uts_swift_proj
//
//  Created by ZhoutongLi on 2023/5/3.
//

import Foundation
import UIKit
import CoreData

class ReceiptViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var specialRequirementsLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else {
            return
        }
        
        nameLabel.text = "Name: " + (user.name ?? "")
        contactNumberLabel.text = "Contact Number: " + (user.contactNumber ?? "")
        emailLabel.text = "Email: " + (user.email ?? "")
        specialRequirementsLabel.text = "Special Requirements: " + (user.specialRequirements ?? "")
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
