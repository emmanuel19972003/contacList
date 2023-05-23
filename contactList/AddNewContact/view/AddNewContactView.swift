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
    
    var contacData: ContactInfo?
    
    lazy private var header = HeaderView(title: AddNewContactStrings.title, iconImage: AddNewContactAssets.editIcon)
    
    lazy private var iconHoderView: UIView = UIView ()
    lazy private var icon = ContactIcon(name: String())
    
    lazy private var nameLablel: UITextField = {
        let text = UITextField()
        text.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        text.textAlignment = .center
        text.layer.cornerRadius = 5
        text.isEnabled = false
        return text
    }()
    
    lazy private var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(saveTapped))
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy private var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(deletTapped))
        button.addGestureRecognizer(tapGesture)
        return button
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
        textField.keyboardType = .numberPad
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
        setUpView()
        setValues(data: data)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        icon.setCornerRadius(radius: iconHoderView.layer.bounds.width / 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValues(data: ContactInfo?) {
        guard let data = data else {
            setEnable()
            return
        }
        contacData = data
        numberEditText.text = data.number
        nameLablel.text = data.name
        addresEditText.text = data.direcction
        
        
        icon = ContactIcon(name: data.name)
        icon.setCornerRadius(radius: 50)
        iconHoderView.fillViewWith(icon)
        
    }
    
    func setUpView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        setUpheader()
        setUpIconHoderView()
        setUpNameLablel()
        setUpActionTabView()
        setUpNumberEditText()
        setUpaddresEditText()
        setUpSaveButton()
        setUpDeleteButton()
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
        iconHoderView.fillViewWith(icon)
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
    
    func setUpaddresEditText() {
        view.addSubview(addresEditText)
        addresEditText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addresEditText.topAnchor.constraint(equalTo: numberEditText.bottomAnchor, constant: spacingConstants.vertical),
            addresEditText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacingConstants.horizontal),
            addresEditText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacingConstants.horizontal),
            addresEditText.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setUpSaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: addresEditText.bottomAnchor, constant: spacingConstants.vertical),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            saveButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setUpDeleteButton() {
        view.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: spacingConstants.vertical),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            deleteButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc func viewTapped() {
        self.view.endEditing(true)
    }
    
    @objc func saveTapped() {
        print("save")
    }
    @objc func deletTapped() {
        print("delet")
    }
    
    func setEnable() {
        numberEditText.isEnabled = true
        addresEditText.isEnabled = true
        nameLablel.isEnabled = true
        nameLablel.text = AddNewContactStrings.name
        let edditTextColor = numberEditText.isEnabled ? UIColor.white : UIColor.systemGray4
        numberEditText.backgroundColor = edditTextColor
        addresEditText.backgroundColor = edditTextColor
        nameLablel.backgroundColor = edditTextColor
        deleteButton.isHidden = true
    }
}

extension AddNewContactView: HeaderViewProtocol {
    func imageTapped() {
        numberEditText.isEnabled.toggle()
        addresEditText.isEnabled.toggle()
        nameLablel.isEnabled.toggle()
        let headerIcon = numberEditText.isEnabled ? AddNewContactAssets.checkIcon : AddNewContactAssets.editIcon
        header.setImage(with: headerIcon)
        let edditTextColor = numberEditText.isEnabled ? UIColor.white : UIColor.systemGray4
        numberEditText.backgroundColor = edditTextColor
        addresEditText.backgroundColor = edditTextColor
        nameLablel.backgroundColor = edditTextColor
        
    }
}

extension AddNewContactView: ActionTabViewProtocol {
    func buttonOnTapped() {
        presenter?.goToImesseges(contacData: contacData)
    }
    
    func buttonTwoTapped() {
        presenter?.goToPhone(contacData: contacData)
    }
    
    func buttonThreeTapped() {
        print("tres")
    }
}

