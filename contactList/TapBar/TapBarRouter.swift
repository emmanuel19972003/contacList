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
    
    func setUpTapBar()
}

class TapBarRouter: TapBarRouterProtocol {
    
    var entry: EnetryPoint?
    var view: UIViewController?
    
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
        router.view = view
        
        return router
    }
    
    func setUpTapBar() {
        let tapBarController = UITabBarController()
        tapBarController.tabBar.isTranslucent = false
        let view1 = ejemplo()
        view1.title = "La uno"
        
        let view2 = ejemplo2()
        view2.title = "La dos"
        
        let view3 = ContactListRouter().getContactList()
        view3.title = "Contact"
        
        tapBarController.setViewControllers([view1, view2, view3], animated: false)
        tapBarController.tabBar.items?[0].image = UIImage(systemName: "house.circle")
        tapBarController.modalPresentationStyle = .fullScreen
        view?.present(tapBarController, animated: false)
    }
}
