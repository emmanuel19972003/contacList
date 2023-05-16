//
//  TapBarInteractor.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/15/23.
//

import Foundation

protocol TapBarInteractorProtocol{
    var presenter: TapBarPresenterPrtocol? { get set }
}

class TapBarInteractor: TapBarInteractorProtocol {
    var presenter: TapBarPresenterPrtocol?
}
