//
//  ContactListPresenter.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/14/23.
//

import Foundation
import UIKit

protocol ContactListPresenterProtocol {
    var router: ContactListRouterProtocol? {get set}
    var interactor: ContactListInteractorProtocol? {get set}
    var view: ContactListViewProtocol? {get set}
    
    func getData()
    func goToAddEditContact()
    func goToAddFavoriteContact()
    func gotEditContact(contacData: ContactInfo)
    func ContactMorePress(contacData: ContactInfo, contactLisType: ContactListType)
    
}

class ContactListPresenter: ContactListPresenterProtocol{
    var router: ContactListRouterProtocol?
    
    var interactor: ContactListInteractorProtocol?
    
    var view: ContactListViewProtocol?
    
    func getData() {
        guard let contactsData = interactor?.getData() else { return }
        view?.updateData(data: contactsData)
    }
    
    func goToAddEditContact() {
        router?.getAddEdditViewController()
    }
    
    func goToAddFavoriteContact() {
        router?.goToAddFavoriteContact()
    }
    
    func gotEditContact(contacData: ContactInfo) {
        router?.gotEditContact(contacData: contacData)
    }
    
    func ContactMorePress(contacData: ContactInfo, contactLisType: ContactListType) {
        switch contactLisType {
        case .main:
            
            gotEditContact(contacData: contacData)
            
        case .favorite:
            
            let alert = UIAlertController(title: ContactListStrings.notFavorite, message: ContactListStrings.notFavotireConformation, preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: ContactListStrings.accept, style: .default) {_ in
                self.view?.notFavorite(contactInfo: contacData)
            }
            let cancel = UIAlertAction(title: ContactListStrings.cancel, style: .destructive)

            alert.addAction(acceptAction)
            alert.addAction(cancel)
            view?.showAlert(alert: alert)
            
        case .addFavorite:
            
            let alert = UIAlertController(title: ContactListStrings.favoriteTitle, message: ContactListStrings.favotireConformation, preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: ContactListStrings.accept, style: .default) {_ in
                self.view?.notFavorite(contactInfo: contacData)
                self.router?.dismisAddFavoriteContact()
            }

            alert.addAction(acceptAction)
            view?.showAlert(alert: alert)
        }
    }
}
