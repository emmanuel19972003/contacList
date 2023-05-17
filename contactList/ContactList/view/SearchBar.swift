//
//  SearchBar.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/16/23.
//

import UIKit

class contactList: UIView {
    lazy var stackHorizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var magnifyingGlassImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        return image
    }()
    
    lazy var inputText: UITextField = {
        let text = UITextField()
        text.placeholder = "Buscar"
        return inputText
    }()
}
