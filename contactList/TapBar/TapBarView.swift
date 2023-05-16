//
//  TapBarView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/15/23.
//

import UIKit

protocol TapBarViewProtocol {
    var presenter: TapBarPresenterPrtocol? { get set }
}

class TapBarView: UIViewController, TapBarViewProtocol {
    var presenter: TapBarPresenterPrtocol?
    let tapBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        let view = ContactListRouter().getContactList()
//        tapBarController.setViewControllers([view], animated: false)
//        tapBarController.modalPresentationStyle = .fullScreen
//        present(view, animated: true)
        
        var Vc = ejemplo()
        self.present(Vc, animated: true)
    }
}
