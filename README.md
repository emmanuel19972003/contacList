# contacList

//
//  MonstroToast.swift
//  Monstro
//
//  Created by Miguel Angel Valcarcel Mendivelso on 1/27/22.
//

import UIKit

enum MonstroToastType {
    case success
    case critical
    case warning
    case info
    case notConnection
}

class MonstroToast {
    let contentView = UIView()
    let messageLabel = UILabel()
    
    init(type: MonstroToastType, message: String) {
        setUpUI(type: type, message: message)
    }

    private func setUpUI(type: MonstroToastType, message: String) {
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.style(Typography.title10)
        messageLabel.textAlignment = .center
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .success:
            contentView.backgroundColor = .successDefault
            messageLabel.textColor = .gloom
        case .critical:
            contentView.backgroundColor = .criticalDefault
            messageLabel.textColor = .whiteMonstro
        case .warning:
            contentView.backgroundColor = .warningClear
            messageLabel.textColor = .gloom
        case .info:
            contentView.backgroundColor = .secondaryClearest
            messageLabel.textColor = .gloom
        case .notConnection:
            contentView.backgroundColor = .grayMonstro
            messageLabel.textColor = .gloom
        }
    }
    
    public func show() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        var toastTopConstant = window.safeAreaInsets.top
        if let tabBarController = window.rootViewController as? TabBarNavigationController {
            toastTopConstant += tabBarController.navigationBar.frame.height
        }
        
        contentView.fillViewWith(messageLabel, leading: 16, trailing: -16)
        
        window.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 40),
            contentView.topAnchor.constraint(equalTo: window.topAnchor, constant: toastTopConstant),
            contentView.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 40),
            contentView.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -40)
        ])
        
        UIView.animate(withDuration: 1.0, delay: 4.0, options: .curveEaseIn, animations: { [weak self] in
            self?.contentView.alpha = 0
        }, completion: { [weak self] _ in
            self?.contentView.removeFromSuperview()
        })
    }

    public func hide(withDuration duration: Double = 1.0) {
        guard duration > .zero else {
            contentView.removeFromSuperview()
            return
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: { [weak self] in
            self?.contentView.alpha = 0
        }, completion: { [weak self] _ in
            self?.contentView.removeFromSuperview()
        })
    }
}

