//
//  ContactListInteractor.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import Foundation

protocol ContactListInteractorProtocol {
    var presenter: ContactListPresenterProtocol? {get set}
}

class ContactListInteractor: ContactListInteractorProtocol {
    var presenter: ContactListPresenterProtocol?
    
}

