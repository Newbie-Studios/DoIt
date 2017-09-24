//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Jamie Roberts on 24/09/2017.
//  Copyright © 2017 Newbie-Studios. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task : Task? = nil //change this so that our variable 'Task' is an optional of Task type with a value of nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.important { //made this a non-optional
            taskLabel.text = "❗️ \(String(describing: task!.name!)) ❗️" //made this a non-optional
        } else {
            taskLabel.text = task!.name! //made this a non-optional
        }
        
        
    }

    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //get the context
        context.delete(task!) //delete what we're on
        (UIApplication.shared.delegate as! AppDelegate).saveContext() //save that action
        navigationController!.popViewController(animated: true) //this will pop the view controller back to the previous screen in the navigation controller
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
