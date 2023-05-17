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
    
    let header = HeaderView(title: "Contacts", iconImage: "person.fill.badge.plus")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        header.delegate = self
        setUpView()
        
        
    }
    
    private func setUpView() {
        setUpHeader()
    }
    
    private func setUpHeader() {
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension ContactListView: HeaderViewProtocol{
    func imageTapped() {
        print("Emma")
    }
}
