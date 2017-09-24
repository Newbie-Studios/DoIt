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
    
    var task = Task()
    var previousVC = TasksViewController() //create varialble called previousVC which is equal to the TasksViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important {
            taskLabel.text = "‼‼ \(task.name) ‼‼"
        } else {
            taskLabel.text = task.name
        }
        
        
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex) //makes it so the action button removes the item from the array at the selected Index
        previousVC.tableView.reloadData() //this tells the tableview from the TaskViewController to reload it's data (and add the new info in)
        navigationController!.popViewController(animated: true) //this will pop the view controller back to the previous screen in the navigation controller
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}