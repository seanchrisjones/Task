//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell else{return UITableViewCell()}
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        cell.primaryLabel.text = task.name
        cell.delegate = self
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.deleteTask(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
           
        }
        
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let destinationViewController = segue.destination as? TaskDetailTableViewController{
               if let indexPath = tableView.indexPathForSelectedRow{
                   let task = TaskController.sharedInstance.tasks[indexPath.row]
                   destinationViewController.task = task
                   
               }
           }
          
       }
    

}
extension TaskListTableViewController : ButtonTableViewCellDelegate{
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else {return}
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        TaskController.sharedInstance.toggleIsCompleteFor(task: task)
        sender.updateTask(withTask: task)
        
        
    }
    
    
    
}
