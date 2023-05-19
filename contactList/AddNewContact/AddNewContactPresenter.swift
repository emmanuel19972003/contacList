//
//  AddNewContactPresenter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import Foundation

protocol AddNewContactPresenterProtocol {
    var view: AddNewContactViewProtocol? { get set}
    var interactor: AddNewContactInteractorProtocol? { get set}
    var router: AddNewContactRouterProtocol? { get set}
}

class AddNewContactPresenter: AddNewContactPresenterProtocol {
    var view: AddNewContactViewProtocol?
    var interactor: AddNewContactInteractorProtocol?
    var router: AddNewContactRouterProtocol?
}
