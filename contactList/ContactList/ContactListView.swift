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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
