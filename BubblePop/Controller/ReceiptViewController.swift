//
//  ReceiptViewController.swift
//  BubblePop
//
//  Created by Harry Hu on 14/5/2023.
//

import Foundation
import UIKit
import CoreData

class ReceiptViewController: UIViewController {


    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var specialRequirementsLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    var name: String?
    var contactNumber: String?
    var email: String?
    var specialRequirements: String?
    var number: String?
    var date: Date = Date()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        contactNumberLabel.text = contactNumber
        emailLabel.text = email
        specialRequirementsLabel.text = specialRequirements
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString


        }
    
    

    
}
