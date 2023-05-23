//
//  MemoryManager.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/22/23.
//

import Foundation
import UIKit

class MemoryManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let share = MemoryManager()
    
    func getAllItems() {
        do {
            let items = try context.fetch(ContactInfoEntity.fetchRequest())
        }
        catch {
            print("Error")
        }
    }
    
}
