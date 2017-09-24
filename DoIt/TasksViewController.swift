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
        
        
        
        tableView.dataSource = self //tableview requires a datasource = self
        tableView.delegate = self //tableview requires a delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks() //adding a viewWillAppear shows our table
        tableView.reloadData() //This makes it so the table reloads each time we go back to the main screen
    }
    
    //TABLEVIEW ALSO REQUIRES TWO FUNCTION - NUMBER OF ROWS IN SECTION AND CELL FOR ROW AT
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count //now returning count of tasks variable
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //cellForRowAt requires a UITableViewCell to be returned so we create constant 'cell'
        let task = tasks[indexPath.row]//create constant task which is equal to indexpath.row of tasks variable
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name!) ❗️" //added the ! to make the return non optional
        } else {
            cell.textLabel?.text = task.name! //added the ! to make the return non optional
        } //added an if statement to say if Important flag is true, add some !!, if not don't do that
        return cell //returning that value
    }
    
    
    
    
    /* func makeTasks() -> [Task] {
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
     
     } We've removed all of this out as we don't need it nor can use it now we have core data */
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "selectTaskSegue", sender: task) //function to allow segue when selecting any option in the table view
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //brings in our contect for CoreData
        do { //Use do command as context.fetch could throw an error
            tasks = try context.fetch(Task.fetchRequest()) as! [Task] //try to do the thing we want to do
            print(tasks)
        } catch { //if it fails, print an error
            print("Error fetching data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //add a prepare for segue so that when it segues it can link the two VCs
        if segue.identifier == "addSegue" {
        }
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    
    
    
}

