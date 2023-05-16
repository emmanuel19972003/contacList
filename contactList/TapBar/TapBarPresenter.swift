//
//  TapBarPresenter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/15/23.
//

import Foundation

protocol TapBarPresenterPrtocol {
    var view: TapBarViewProtocol? { get set }
    var interactor: TapBarInteractorProtocol? { get set }
    var router: TapBarRouterProtocol? { get set }
}

class TapBarPresenter: TapBarPresenterPrtocol {
    var view: TapBarViewProtocol?
    var interactor: TapBarInteractorProtocol?
    var router: TapBarRouterProtocol?
}
