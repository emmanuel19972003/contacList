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
    
}
