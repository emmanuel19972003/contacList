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
        view.backgroundColor = .green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.setUpTapBar()
    }
    
    @objc func goToThreePress() {
    }
}

class ejemplo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

class ejemplo2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
