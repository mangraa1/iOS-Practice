//
//  DataStoreManager.swift
//  CoreData-practice1
//
//  Created by mac on 01.10.2023.
//

import Foundation
import CoreData

class DataStoreManager {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData_practice1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    // MARK: - CRUD

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func obtainMainUser() -> User {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")

        // Does the mainUser exist
        if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {

            return users.first!

        } else {

            let company = Company(context: viewContext)
            company.name = "Apple"

            let user = User(context: viewContext)
            user.name = "First User"
            user.company = company
            user.age = 21
            user.isMain = true

            do {
                try viewContext.save()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }

            return user
        }
    }

    func updateMainUser(with name: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")

        if let users = try? viewContext.fetch(fetchRequest) as? [User] {

            guard let mainUser = users.first else { return }

            mainUser.name = name

            try? viewContext.save()
        }
    }

    func removeMainUser() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")

        if let users = try? viewContext.fetch(fetchRequest) as? [User] {

            guard let mainUser = users.first else { return }

            viewContext.delete(mainUser)

            try? viewContext.save()
        }
    }
}
