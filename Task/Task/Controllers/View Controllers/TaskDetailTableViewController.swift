//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    //MARK: OUTLETS
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    //MARK: PROPERTIES
    var task: Task?
    var dueDateValue: Date?
    
    //MARK: LIFECYCLE FUNCTIONS
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        updateViews()
}

    //MARK: ACTIONS

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !taskNameTextField.text!.isEmpty else {return}
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        if let task = self.task{
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: dueDate)
        } else {
            TaskController.sharedInstance.createTask(with: name, notes: notes, due: dueDate)
            
        }
        TaskController.sharedInstance.saveToPersistentStore()
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        taskNameTextField.text = ""
        dueDateTextField.text = ""
        notesTextView.text = ""
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker){
       
            self.dueDateTextField.text = self.dueDatePicker.date.stringValue()
    }
    
    //MARK: CLASS METHODS
    
    private func updateViews() {
           guard let task = task, isViewLoaded else { return }
           title = task.name
           taskNameTextField.text = task.name
           dueDateTextField.text = (task.due as Date?)?.stringValue()
           notesTextView.text = task.notes

       }
    
    
    // MARK: - Navigation


   
   

}
