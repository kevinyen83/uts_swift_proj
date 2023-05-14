
//
//  DetailViewController.swift
//  BubblePop
//
//  Created by Harry Hu on 14/5/2023.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var contactNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var specialRequirementsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
//    @IBAction func submitButton(_ sender: Any) {
//        guard let contactNumber = contactNumberTextField.text,
//              let name = nameTextField.text,
//              let email = emailTextField.text,
//              let specialRequirements = specialRequirementsTextField.text else {
//            // Handle error, some text fields are empty
//            return
//        }
//        let receiptVC = ReceiptViewController()
//        
//        // Set the properties of the next view controller with the entered information
//        receiptVC.contactNumber = contactNumber
//        receiptVC.name = name
//        receiptVC.email = email
//        receiptVC.specialRequirements = specialRequirements
//        
//        // Navigate to the next view controller
//        navigationController?.pushViewController(receiptVC, animated: true)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReceiptSegue" {
            let VC = segue.destination as! ReceiptViewController
                VC.name = nameTextField.text!
                VC.contactNumber = contactNumberTextField.text!
                VC.email = emailTextField.text!
                VC.specialRequirements = specialRequirementsTextField.text!
            }
        }
    func isEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    func isInputValid() -> Bool {
        if let contactNumber = contactNumberTextField.text, let number = Int(contactNumber) {
            if number > 10 {
                return false
            }
        } else {
            return false
        }
        
        if let email = emailTextField.text {
            if !isEmailValid(email) {
                return false
            }
        } else {
            return false
        }
        
        return true
    }

    @IBAction func submitButton(_ sender: Any) {
        if !isInputValid() {
            let alertController = UIAlertController(title: "Error", message: "Please check your input and try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let receiptVC = ReceiptViewController()
        receiptVC.contactNumber = contactNumberTextField.text!
        receiptVC.name = nameTextField.text!
        receiptVC.email = emailTextField.text!
        receiptVC.specialRequirements = specialRequirementsTextField.text!
        navigationController?.pushViewController(receiptVC, animated: true)
    }

    }
    

