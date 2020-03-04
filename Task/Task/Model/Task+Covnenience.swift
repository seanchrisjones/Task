//
//  Task+Covnenience.swift
//  Task
//
//  Created by Sean Jones on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Task{
    
    convenience init(name: String, notes: String? = nil, due: Date? = nil, complete: Bool, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        self.complete = complete
    }
}
