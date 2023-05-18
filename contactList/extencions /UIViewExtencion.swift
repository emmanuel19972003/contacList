//
//  UIViewExtencion.swift
//  contactList
//
//  Created by ZAMBRANO Emmanuel on 17/05/23.
//

import UIKit

extension UIView {
    func fillViewWith(_ view: UIView, top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0, zindex: Int? = nil) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let zindex = zindex {
            insertSubview(view, at: zindex)
        } else {
            addSubview(view)
        }
        
        view.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing).isActive = true
    }
    
    func rotateWithAnimation(_ rotate: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(rotationAngle: rotate ? 0 : .pi)
        })
    }

}
