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
}

extension TapBarRouter {
    func setUpTapBar() {
        
        let tapBarController = UITabBarController()
        tapBarController.tabBar.isTranslucent = false
        
        let view1 = ejemplo()
        view1.title = "Favorites"
        
        let contactsViewController = ContactListRouter().getContactList()
        contactsViewController.title = "Contacts"
    
        
        tapBarController.setViewControllers([view1, contactsViewController], animated: false)
        
        tapBarController.tabBar.items?[0].image = UIImage(systemName: "star")
        tapBarController.tabBar.items?[0].selectedImage = UIImage(systemName: "star.fill")
        
        tapBarController.tabBar.items?[1].image = UIImage(systemName: "person.crop.circle")
        tapBarController.tabBar.items?[1].selectedImage = UIImage(systemName: "person.crop.circle.fill")
        
        tapBarController.modalPresentationStyle = .fullScreen
        view?.present(tapBarController, animated: false)
    }
}
