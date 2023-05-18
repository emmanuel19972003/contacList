//
//  SearchBar.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/16/23.
//

import UIKit

class SearchBar: UIView {
    
    lazy private var stackHorizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray5
        stackView.layer.cornerRadius = 15
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    lazy private var magnifyingGlassImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: ContactListStrings.magnifyingglass)
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        return image
    }()
    
    lazy private var inputText: UITextField = {
        let text = UITextField()
        text.placeholder = ContactListStrings.search
        return text
    }()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.fillViewWith(stackHorizontalView)
        setUpMagnifyingGlassImage()
        setUpInputText()
    }
    
    private func setUpMagnifyingGlassImage() {
        magnifyingGlassImage.translatesAutoresizingMaskIntoConstraints = false
        stackHorizontalView.addArrangedSubview(magnifyingGlassImage)
        NSLayoutConstraint.activate([
            magnifyingGlassImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            magnifyingGlassImage.heightAnchor.constraint(equalToConstant: 25),
            magnifyingGlassImage.widthAnchor.constraint(equalTo: magnifyingGlassImage.heightAnchor)
        ])
    }
    
    private func setUpInputText() {
        inputText.translatesAutoresizingMaskIntoConstraints = false
        stackHorizontalView.addArrangedSubview(inputText)
        NSLayoutConstraint.activate([
            inputText.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
    }
}
