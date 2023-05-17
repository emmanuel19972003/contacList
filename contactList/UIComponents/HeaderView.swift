//
//  HeaderView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/16/23.
//

import UIKit

protocol HeaderViewProtocol {
    func imageTapped()
}

class HeaderView: UIView {
    
    var delegate: HeaderViewProtocol?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    init(title: String, iconImage: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: iconImage)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setUpTitleLabel()
        setUpIconImageView()
    }
    
    private func setUpTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setUpIconImageView() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1.0)
        ])
    }
}

extension HeaderView {
    @objc func imageTapped() {
        delegate?.imageTapped()
    }
}
