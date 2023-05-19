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

class AddNewContactView: UIViewController ,AddNewContactViewProtocol {
    
    var presenter: AddNewContactPresenterProtocol?
    
    lazy private var header = HeaderView(title: "Add Contact", iconImage: "square.and.pencil")
    
    lazy private var iconHoderView: UIView = UIView ()
    
    lazy private var nameLablel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var numberEditText: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Number"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.isEnabled = false
        return textField
    }()
    
    
    
    init (data: ContactInfo? = nil) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
