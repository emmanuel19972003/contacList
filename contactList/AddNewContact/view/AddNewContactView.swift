//
//  AddNewContactView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import UIKit

protocol AddNewContactViewProtocol {
    var presenter: AddNewContactPresenterProtocol? { get set }
}

struct spacingConstants{
    static let horizontal: CGFloat = 16.0
    static let vertical: CGFloat = 15.0
}

class AddNewContactView: UIViewController ,AddNewContactViewProtocol {
    
    var presenter: AddNewContactPresenterProtocol?
    
    lazy private var header = HeaderView(title: AddNewContactStrings.title, iconImage: AddNewContactAssets.editIcon)
    
    lazy private var iconHoderView: UIView = UIView ()
    
    lazy private var nameLablel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        label.textAlignment = .center
        label.text = "Emma "
        return label
    }()
    
    lazy private var actionTabView = ActionTabView(buttonOneImage: AddNewContactAssets.messegesIcon, buttonOneLabel: AddNewContactStrings.messeges,
                                                           buttonTwoImage: AddNewContactAssets.phoneIcon, buttonTwoLabel: AddNewContactStrings.call,
                                                           buttonThreeImage: AddNewContactAssets.phoneHistoirIcon, buttonThreeLabel: AddNewContactStrings.history)
    
    lazy private var numberEditText: UITextField = {
        let textField = UITextField()
        textField.placeholder = AddNewContactStrings.number
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray4
        textField.isEnabled = false
        return textField
    }()
    
    lazy private var addresEditText: UITextField = {
        let textField = UITextField()
        textField.placeholder = AddNewContactStrings.addres
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .systemGray4
        textField.isEnabled = false
        return textField
    }()
    
    init (data: ContactInfo? = nil) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGray6
        iconHoderView.backgroundColor = .black//Borrar
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        setUpheader()
        setUpIconHoderView()
        setUpNameLablel()
        setUpActionTabView()
        setUpNumberEditText()
    }
    
    func setUpheader() {
        header.delegate = self
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacingConstants.vertical),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingConstants.horizontal),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingConstants.horizontal),
            header.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setUpIconHoderView() {
        view.addSubview(iconHoderView)
        iconHoderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconHoderView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: spacingConstants.vertical),
            iconHoderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconHoderView.heightAnchor.constraint(equalToConstant: 100),
            iconHoderView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setUpNameLablel() {
        view.addSubview(nameLablel)
        nameLablel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLablel.topAnchor.constraint(equalTo: iconHoderView.bottomAnchor, constant: spacingConstants.vertical),
            nameLablel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingConstants.horizontal),
            nameLablel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingConstants.horizontal)
        ])
    }
    
    func setUpActionTabView() {
        actionTabView.delegate = self
        view.addSubview(actionTabView)
        actionTabView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionTabView.topAnchor.constraint(equalTo: nameLablel.bottomAnchor, constant: spacingConstants.vertical),
            actionTabView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingConstants.horizontal),
            actionTabView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingConstants.horizontal),
            actionTabView.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func setUpNumberEditText() {
        view.addSubview(numberEditText)
        numberEditText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberEditText.topAnchor.constraint(equalTo: actionTabView.bottomAnchor, constant: spacingConstants.vertical),
            numberEditText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingConstants.horizontal),
            numberEditText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingConstants.horizontal),
            numberEditText.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension AddNewContactView: HeaderViewProtocol {
    func imageTapped() {
        numberEditText.isEnabled.toggle()
        addresEditText.isEnabled.toggle()
        let headerIcon = numberEditText.isEnabled ? AddNewContactAssets.checkIcon : AddNewContactAssets.editIcon
        header.setImage(with: headerIcon)
        let edditTextColor = numberEditText.isEnabled ? UIColor.white : UIColor.systemGray4
        numberEditText.backgroundColor = edditTextColor
        addresEditText.backgroundColor = edditTextColor
        
    }
}

extension AddNewContactView: ActionTabViewProtocol {
    func buttonOnTapped() {
        print("uno")
    }
    
    func buttonTwoTapped() {
        print("dos")
    }
    
    func buttonThreeTapped() {
        print("tres")
    }
}

