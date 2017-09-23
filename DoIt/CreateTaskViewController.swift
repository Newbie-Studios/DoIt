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
    
  var previousVC = TasksViewController() //create varialble called previousVC which is equal to the TasksViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
    let task = Task() //create a constant called task
        task.name = taskNameTextField.text! //that constants name will be whatever is in the text box
        task.important = importantSwitch.isOn //the importance switch will decide what's in there
        
        previousVC.tasks.append(task) //appends the task from this function to the 'tasks' variable we specified in the previousVC (TasksViewController)
        previousVC.tableView.reloadData() //this tells the tableview from the TaskViewController to reload it's data (and add the new info in)
        navigationController!.popViewController(animated: true) //this will pop the view controller back to the previous screen in the navigation controller
        
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
