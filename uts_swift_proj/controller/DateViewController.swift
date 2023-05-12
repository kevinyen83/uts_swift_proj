//
//  DateViewController.swift
//  uts_swift_proj
//
//  Created by Harry Hu on 12/5/2023.
//
import UIKit
import CoreData

class DateViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
  

    @IBOutlet weak var numberTextField: UITextField!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var number:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date()
    }
    
    @IBAction func bookButtonTapped(_ sender: Any) {
        guard let numberString = numberTextField.text,
              let number = Int(numberString) else {
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
}
