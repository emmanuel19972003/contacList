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
    
    let header = HeaderView()
    
    let seachBar = SearchBar()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ContactsListTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsListTableViewCell")
        return tableView
    }()
    
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
        setUpTableView()
    }
    
    private func setUpHeader() {
        //TODO: add strings and assets
        switch contactLisType {
        case .main:
            header.setTitle(with: ContactListStrings.contacts)
            header.setImage(with: "person.fill.badge.plus")
        case.favorite:
            header.setTitle(with: ContactListStrings.favorite)
            header.setImage(with: "star.fill")
        case .addFavorite:
            header.setTitle(with: ContactListStrings.addFavorite)
            header.setImage(with: "star")
            
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
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: seachBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ContactListView: HeaderViewProtocol{
    func imageTapped() {
        print("Emma")
    }
}

extension ContactListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "ContactsListTableViewCell", for: indexPath)
        if let cell = cell as? ContactsListTableViewCell {
            cell.setupCell(name: "Emma \(indexPath.row)", number: "\(indexPath.row)", image: "", cellrow: indexPath.row)
            cell.delegate = self
        }
        cell.selectionStyle = .none
//        cell.layoutIfNeeded()
//        cell.updateConstraintsIfNeeded()
        return cell
    }
}

extension ContactListView: ContactsListTableViewCellProtocol {
    func reloadCell(index: Int?) {
        guard let index = index else { return }
        let indexPaths = [index].map({ IndexPath(row: $0, section: 0) })
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.tableView.performBatchUpdates(nil)
        }
    }
}
