//
//  SwiftUIView.swift
//  uts_swift_proj
//
//  Created by KerwinYen on 5/2/23.
//

import UIKit
import CoreData


class DetailViewController: UIViewController {
        
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var contactNumberTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var specialRequirementsTextField: UITextField!
        
        var managedObjectContext: NSManagedObjectContext?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            managedObjectContext = appDelegate.persistentContainer.viewContext
        }
        
        @IBAction func saveButtonTapped(_ sender: Any) {
            guard let context = managedObjectContext,
                  let name = nameTextField.text,
                  let contactNumber = contactNumberTextField.text,
                  let email = emailTextField.text,
                  let specialRequirements = specialRequirementsTextField.text else {
                return
            }
            
            let user = User(context: context)
            user.name = name
            user.contactNumber = contactNumber
            user.email = email
            user.specialRequirements = specialRequirements
            
            do {
                try context.save()
                print("Data saved successfully!")
            } catch let error as NSError {
                print("Could not save data. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    class User: NSManagedObject {
        @NSManaged var name: String?
        @NSManaged var contactNumber: String?
        @NSManaged var email: String?
        @NSManaged var specialRequirements: String?
        
        convenience init(context: NSManagedObjectContext) {
            let entityDescription = NSEntityDescription.entity(forEntityName: "Reservation", in: context)!
            self.init(entity: entityDescription, insertInto: context)
        }
    }
