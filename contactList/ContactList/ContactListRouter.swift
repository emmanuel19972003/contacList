//
//  ContactListRouter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import UIKit

protocol ContactListRouterProtocol {
    func getContactList() -> UIViewController
    func getContactListAsTap() -> UIViewController
}
//vip
class ContactListRouter: ContactListRouterProtocol {
    
    func getContactList() -> UIViewController {
        
        let router = ContactListRouter()
        let presenter = ContactListPresenter()
        let view = ContactListView()
        let interactor = ContactListInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view  = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
    func getContactListAsTap() -> UIViewController {
        let view = getContactList()
        view.title = "contact"
        return view
    }
    
}
