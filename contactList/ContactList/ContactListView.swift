//
//  ContactListView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import UIKit

protocol ContactListViewProtocol {
    var presenter: ContactListPresenterProtocol? {get set}
}

class ContactListView: UIViewController, ContactListViewProtocol {
    weak var viewController: UIViewController?// add to router
    var presenter: ContactListPresenterProtocol?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.green, for: .normal)
        button.setTitle("Button Title", for: .normal)
        button.addTarget(self, action: #selector(goToThreePress), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
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
    
    @objc func goToThreePress() {
        var Vc = ejemplo()
        self.present(Vc, animated: true)
    }
    
}

class ejemplo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}
