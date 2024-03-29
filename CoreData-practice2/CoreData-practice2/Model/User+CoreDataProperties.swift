//
//  User+CoreDataProperties.swift
//  CoreData-practice2
//
//  Created by mac on 04.10.2023.
//
//

import Foundation
import CoreData
import UIKit


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var avatar: UIImage?
    @NSManaged public var book: Book?

}

extension User : Identifiable {

}
