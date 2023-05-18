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
    
    var contactLisType: ContactListType
    
    var presenter: ContactListPresenterProtocol?
    //TODO: add empty init este se ve horrible
    let header = HeaderView(title: "Contacts", iconImage: "person.fill.badge.plus")
    
    let seachBar = SearchBar()
    
    init(contactLisType: ContactListType = .main) {
            self.contactLisType = contactLisType
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        header.delegate = self
        setUpView()
    }
    
    private func setUpView() {
        setUpHeader()
        setUpSearchBar()
    }
    
    private func setUpHeader() {
        switch contactLisType {
        case .main:
            header.setTitle(with: ContactListStrings.contacts)
            header.setImage(with: "person.fill.badge.plus")
        case.favorite:
            header.setTitle(with: ContactListStrings.favorite)
        case .addFavorite:
            header.setTitle(with: ContactListStrings.addFavorite)
            
        }
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setUpSearchBar() {
        view.addSubview(seachBar)
        seachBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seachBar.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            seachBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            seachBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            seachBar.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension ContactListView: HeaderViewProtocol{
    func imageTapped() {
        print("Emma")
    }
}
