//
//  ContactListPresenter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import Foundation

protocol ContactListPresenterProtocol {
    var router: ContactListRouterProtocol? {get set}
    var interactor: ContactListInteractorProtocol? {get set}
    var view: ContactListViewProtocol? {get set}
    
    func interactorCosas()
}

class ContactListPresenter: ContactListPresenterProtocol{
    var router: ContactListRouterProtocol?
    
    var interactor: ContactListInteractorProtocol?
    
    var view: ContactListViewProtocol?
    
    func interactorCosas() {
    }
}
