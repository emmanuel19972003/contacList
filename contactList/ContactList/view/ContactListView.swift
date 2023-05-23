//
//  ContactListView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import UIKit

protocol ContactListViewProtocol {
    var presenter: ContactListPresenterProtocol? {get set}
    
    func updateData(data: [ContactInfo])
    func showAlert(alert: UIAlertController)
    func notFavorite(contactInfo: ContactInfo)
}

class ContactListView: UIViewController, ContactListViewProtocol {
    
    var contactLisType: ContactListType
    
    var presenter: ContactListPresenterProtocol?
    
    let header = HeaderView()
    
    let seachBar = SearchBar()
    
    var data: [ContactInfo]?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getData()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func updateData(data: [ContactInfo]) {
        self.data = data
        tableView.reloadData()
    }
    
    func showAlert(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    func notFavorite(contactInfo: ContactInfo) {
        let index = data?.firstIndex(where: {$0.number ==  contactInfo.number})
        
    }
    
    private func setUpView() {
        setUpHeader()
        setUpSearchBar()
        setUpTableView()
    }
    
    private func setUpHeader() {
        switch contactLisType {
        case .main:
            header.setTitle(with: ContactListStrings.contacts)
            header.setImage(with: ContactListAsstesList.personContact)
        case.favorite:
            header.setTitle(with: ContactListStrings.favorite)
            header.setImage(with: ContactListAsstesList.starFill)
        case .addFavorite:
            header.setTitle(with: ContactListStrings.addFavorite)
            header.setImage(with: ContactListAsstesList.star)
            
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

extension ContactListView: HeaderViewProtocol {
    func imageTapped() {
        switch contactLisType {
        case .main:
            presenter?.goToAddEditContact()
        case .favorite:
            presenter?.goToAddFavoriteContact()
        case .addFavorite:
            return
        }
    }
}

extension ContactListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let index = indexPath.row
        guard let currentItem = data?[index] else { return cell}
        
        cell = tableView.dequeueReusableCell(withIdentifier: "ContactsListTableViewCell", for: indexPath)
        
        if let cell = cell as? ContactsListTableViewCell {
            cell.setupCell(name: currentItem.name, number: currentItem.number, image: nil, cellrow: indexPath.row)
            cell.delegate = self
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension ContactListView: ContactsListTableViewCellProtocol {
    func reloadCell() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            [weak self] in
            self?.tableView.performBatchUpdates(nil)
        })
    }
    
    func editContactTaped(index: Int?) {
        guard let index = index,
              let contacData = data?[index] else { return }
        
        presenter?.ContactMorePress(contacData: contacData, contactLisType: contactLisType)
    }
}
