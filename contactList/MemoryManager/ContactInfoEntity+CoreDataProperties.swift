//
//  ContactInfoEntity+CoreDataProperties.swift
//  
//
//  Created by Emmanuel Zambrano Quitian on 5/22/23.
//
//

import Foundation
import CoreData


extension ContactInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactInfoEntity> {
        return NSFetchRequest<ContactInfoEntity>(entityName: "ContactInfoEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var image: String?
    @NSManaged public var direcction: String?
    @NSManaged public var isfavorite: Bool

}
