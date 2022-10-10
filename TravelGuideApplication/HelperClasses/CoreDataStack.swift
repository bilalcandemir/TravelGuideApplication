//
//  CoreDataStack.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/30/22.
//

import Foundation
import CoreData
class CoreDataStack {
    private let entityName:String
    
    init(entityName:String){
        self.entityName = entityName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: entityName)
        
        container.loadPersistentStores { _, error in
            if let error = error {
                print("unsuccesfull container loading..: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
