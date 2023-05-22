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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.setUpTapBar()
    }
}
