//
//  AddNewContactRouter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import UIKit

protocol AddNewContactRouterProtocol {
    func getNewContact(data: ContactInfo? ) -> UIViewController
}

class AddNewContactRouter: AddNewContactRouterProtocol {
    func getNewContact(data: ContactInfo? = nil) -> UIViewController {
        let router = AddNewContactRouter()
        
        let view = AddNewContactView(data: data)
        let interactor = AddNewContactInteractor()
        let presenter = AddNewContactPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
