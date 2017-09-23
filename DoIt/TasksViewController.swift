//
//  TasksViewController.swift
//  DoIt
//
//  Created by Jamie Roberts on 23/09/2017.
//  Copyright © 2017 Newbie-Studios. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = [] //create a variable called tasks which is of the Task type equal to an empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        
        tasks = makeTasks() //reassign our tasks variable equal to our function makeTasks (this needs to be before datasource and delegate)
        
        tableView.dataSource = self //tableview requires a datasource = self
        tableView.delegate = self //tableview requires a delegate = self
        
    }
 
    
    //TABLEVIEW ALSO REQUIRES TWO FUNCTION - NUMBER OF ROWS IN SECTION AND CELL FOR ROW AT
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count //now returning count of tasks variable
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //cellForRowAt requires a UITableViewCell to be returned so we create constant 'cell'
        let task = tasks[indexPath.row]//create constant task which is equal to indexpath.row of tasks variable
        if task.important {
                  cell.textLabel?.text = "‼‼ \(task.name) ‼‼"
        } else {
                 cell.textLabel?.text = task.name
        } //added an if statement to say if Important flag is true, add some !!, if not don't do that
        return cell //returning that value
    }

    
    
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the Cat"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Wash the dishes"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Hoover"
        task3.important = false
        
        return [task1,task2,task3]
        
    } //create function that includes all our tasks we're making

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //add a prepare for segue so that when it segues it can link the two VCs
        let nextVC = segue.destination as! CreateTaskViewController //create constant called next VC which links to Create VC
        nextVC.previousVC = self //state that nextVC.previousVC is equal to self (this VC)
    }
    
    
}

