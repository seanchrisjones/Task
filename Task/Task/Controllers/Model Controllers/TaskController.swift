//
//  TaskController.swift
//  Task
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class TaskController{
    
    //MARK: SOURCE OF TRUTH
    
    var tasks: [Task]{
        let  fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        return( try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    var mockData: [Task]{
        
        let task1 = Task(name: "Laundry")
        let task2 = Task(name: "groceries")
        let task3 = Task(name: "oil change")
        return [task1, task2, task3]
    }
    
    
    //MARK: SINGLETON
    static var sharedInstance = TaskController()
    
    //MARK: CRUD FUNCTIONS
    
    func createTask(with name: String, notes: String?, due: Date?){
        Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func deleteTask(task: Task){
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
        
    }
    
  func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due

        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
           do{
               try CoreDataStack.context.save()
           }catch{
               print("There was an error saving the data!!! \(#function) \(error.localizedDescription)")
           }
       }
    
    func toggleIsCompleteFor(task: Task){
        task.complete = !task.complete
        saveToPersistentStore()
        
    }
    
}
