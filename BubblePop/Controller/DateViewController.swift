//
//  SettingViewController.swift
//  BubblePop
//
//  Created by Harry Hu on 21/4/2023.
//

import Foundation
import UIKit

class DateViewController: UIViewController {

    
    @IBOutlet weak var numberTextField: UITextField!
    var number:Int?
    @IBOutlet weak var datePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date()
    }
    
    @IBAction func bookButtonTapped(_ sender: Any) {
        guard let numberString = numberTextField.text,
              let _ = Int(numberString) else {
            let alert = UIAlertController(title: "Invalid Number", message: "Please enter a valid number.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let selectedDate = datePicker.date
        let currentDate = Date()
        
        if selectedDate < currentDate {
            let alert = UIAlertController(title: "Invalid Date", message: "Please select a valid date.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
       
        
        let alert = UIAlertController(title: "Booking Success", message: "Your booking has been confirmed.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReceiptSegue" {
            let VC = segue.destination as! ReceiptViewController
            VC.number = numberTextField.text!
            VC.date = datePicker.date
            }
        }
}
