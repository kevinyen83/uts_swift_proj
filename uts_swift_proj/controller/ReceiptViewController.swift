//
//  ReceiptViewController.swift
//  uts_swift_proj
//
//  Created by ZhoutongLi on 2023/5/3.
//

import Foundation
import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var specialRequirementsLabel: UILabel!
    
    var name:String?
    var contactNumber:String?
    var specialRequirements:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = name
        contactNumberLabel.text = contactNumber
        specialRequirementsLabel.text = specialRequirements
    }


}
