//
//  CoreDataStack.swift
//  Journal+NSFRC27
//
//  Created by Jason Mandozzi on 6/20/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
//        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        
        let container = NSPersistentContainer(name: "Journal_NSFRC27")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext {return container.viewContext}
}
