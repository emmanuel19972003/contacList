//
//  ContactListRouter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import UIKit

protocol ContactListRouterProtocol {
    func getContactList(type: ContactListType) -> UIViewController
    
    func getAddEdditViewController()
    func goToAddFavoriteContact()
    var view: UIViewController? { get set }
}

class ContactListRouter: ContactListRouterProtocol {
    
    var view: UIViewController?
    
    func getContactList(type: ContactListType) -> UIViewController {
        
        let router = ContactListRouter()
        let presenter = ContactListPresenter()
        let view = ContactListView(contactLisType: type)
        let interactor = ContactListInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view  = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view
        
        return view
    }
    
    func getAddEdditViewController() {
        let viewController = AddNewContactRouter().getNewContact()
        view?.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func goToAddFavoriteContact() {
        let viewController = AddNewContactRouter().getNewContact()
        view?.present(viewController, animated: true)
    }
}
