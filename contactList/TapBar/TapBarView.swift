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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.setTitle("Button Title", for: .normal)
        button.addTarget(self, action: #selector(goToThreePress), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
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
