//
//  TapBarRouter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/15/23.
//

import UIKit

typealias EnetryPoint = TapBarViewProtocol & UIViewController

protocol TapBarRouterProtocol {
    static func getTapBar() -> TapBarRouterProtocol
    var entry: EnetryPoint? {get set}
}

class TapBarRouter: TapBarRouterProtocol {
    
    var entry: EnetryPoint?
    
    static func getTapBar() -> TapBarRouterProtocol {
        
        let router = TapBarRouter()
        let presenter = TapBarPresenter()
        let view = TapBarView()
        let interactor = TapBarInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EnetryPoint
        
        return router
    }
}
