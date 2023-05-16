# contacList

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
