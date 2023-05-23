//
//  ContactInfoEntity+CoreDataProperties.swift
//  
//
//  Created by ZAMBRANO Emmanuel on 23/05/23.
//
//

import Foundation
import CoreData


extension ContactInfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactInfoEntity> {
        return NSFetchRequest<ContactInfoEntity>(entityName: "ContactInfoEntity")
    }

    @NSManaged public var direcction: String?
    @NSManaged public var image: String?
    @NSManaged public var isfavorite: Bool
    @NSManaged public var name: String?
    @NSManaged public var number: String?

}
