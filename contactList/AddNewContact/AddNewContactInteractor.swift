//
//  AddNewContactInteractor.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import Foundation

protocol AddNewContactInteractorProtocol {
    var presenter: AddNewContactPresenterProtocol? { get set }
}

class AddNewContactInteractor: AddNewContactInteractorProtocol {
    var presenter: AddNewContactPresenterProtocol?
    
}
