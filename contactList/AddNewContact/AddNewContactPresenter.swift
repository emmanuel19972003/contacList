//
//  AddNewContactPresenter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import Foundation
import UIKit

protocol AddNewContactPresenterProtocol {
    var view: AddNewContactViewProtocol? { get set}
    var interactor: AddNewContactInteractorProtocol? { get set}
    var router: AddNewContactRouterProtocol? { get set}
    
    func goToImesseges(contacData: ContactInfo?)
    func goToPhone(contacData: ContactInfo?)
}

class AddNewContactPresenter: AddNewContactPresenterProtocol {
    
    var view: AddNewContactViewProtocol?
    var interactor: AddNewContactInteractorProtocol?
    var router: AddNewContactRouterProtocol?
    
    func goToImesseges(contacData: ContactInfo?) {
        guard var number = contacData?.number else { return }
        var url = URL(string: "")
        number = number.replacingOccurrences(of: " ", with: "")
        guard let urlImessage = URL(string: "imessage://\(number)&body=Hi!") else { return }
        url = urlImessage
        guard let url = url else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func goToPhone(contacData: ContactInfo?) {
        guard var number = contacData?.number else { return }
        var url = URL(string: "")
        number = number.replacingOccurrences(of: " ", with: "")
        guard let urlImessage = URL(string: "tel:\(number)") else { return }
        url = urlImessage
        guard let url = url else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
