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
        
        let favoriteContactsViewController = ContactListRouter().getContactList(type: .favorite)
        favoriteContactsViewController.title = TapBarStrings.favorite
        
        let contactsViewController = ContactListRouter().getContactList(type: .main)
        contactsViewController.title = TapBarStrings.contacts
    
        
        tapBarController.setViewControllers([favoriteContactsViewController, contactsViewController], animated: false)
        
        tapBarController.tabBar.items?[0].image = UIImage(systemName: TapBarStrings.starImage)
        tapBarController.tabBar.items?[0].selectedImage = UIImage(systemName: TapBarStrings.starFillImage)
        
        tapBarController.tabBar.items?[1].image = UIImage(systemName: TapBarStrings.contactsImage)
        tapBarController.tabBar.items?[1].selectedImage = UIImage(systemName: TapBarStrings.contactsFillImage)
        
        tapBarController.modalPresentationStyle = .fullScreen
        view?.present(tapBarController, animated: false)
    }
}
