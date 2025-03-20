//
//  ContactListInteractor.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import Foundation

protocol ContactListInteractorProtocol {
    var presenter: ContactListPresenterProtocol? {get set}
    
    func getData() -> [ContactInfo]
}

class ContactListInteractor: ContactListInteractorProtocol {
    var presenter: ContactListPresenterProtocol?
    
    func getData() -> [ContactInfo] {
        return [ContactInfo(name: "Emma", number: "23432534"),
                ContactInfo(name: "Dane", number: "302 3240145"),
                ContactInfo(name: "Juanis", number: "5345435"),
                ContactInfo(name: "Patty", number: "36544")
                
        ]
    }
    
}

