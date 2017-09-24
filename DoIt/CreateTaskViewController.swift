//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Jamie Roberts on 23/09/2017.
//  Copyright © 2017 Newbie-Studios. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //allows us to access the CoreData we've created
        let task = Task(context: context) //create a constant called task
        task.name = taskNameTextField.text! //that constants name will be whatever is in the text box
        task.important = importantSwitch.isOn //the importance switch will decide what's in there
        (UIApplication.shared.delegate as! AppDelegate).saveContext() //allows us to save the entered data back to the core data
        navigationController!.popViewController(animated: true) //this will pop the view controller back to the previous screen in the navigation controller
        
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
