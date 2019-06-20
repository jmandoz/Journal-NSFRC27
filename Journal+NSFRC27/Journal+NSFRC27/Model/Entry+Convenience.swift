//
//  Entry+Convenience.swift
//  Journal+NSFRC27
//
//  Created by Jason Mandozzi on 6/20/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

import CoreData

extension Entry {
    convenience init(title: String, body: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        
        
        self.init(context: context)
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
}
