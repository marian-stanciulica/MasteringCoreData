//
//  ViewController.swift
//  Notes
//
//  Created by Marian Stanciulica on 17/09/2018.
//  Copyright © 2018 Marian Stanciulica. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Properties
    
    private let coreDataManager = CoreDataManager(modelName: "Notes")
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: coreDataManager.managedObjectContext) {
            print(entityDescription.name ?? "No Name")
            print(entityDescription.properties)

            // Initialize Managed Object
            let note = Note(context: coreDataManager.managedObjectContext)
            
            // Configure Managed Object
            note.title = "My First Note"
            note.createdAt = Date()
            note.updatedAt = Date()
            
            print(note)
            
            do {
                try coreDataManager.managedObjectContext.save()
            } catch {
                print("Unable to Save Managed Object Context")
                print("\(error), \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

