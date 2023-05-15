//
//  ContactListRouter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import UIKit

typealias EnetryPoint = ContactListViewProtocol & UIViewController

protocol ContactListRouterProtocol {
    static func getContactList() -> ContactListRouterProtocol
    var entry: EnetryPoint? {get set}
}
//vip
class ContactListRouter: ContactListRouterProtocol {
    var entry: EnetryPoint?
    
    static func getContactList() -> ContactListRouterProtocol {
        
        let router = ContactListRouter()
        let presenter = ContactListPresenter()
        let view = ContactListView()
        let interactor = ContactListInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view  = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EnetryPoint
        
        return router
    }
}
