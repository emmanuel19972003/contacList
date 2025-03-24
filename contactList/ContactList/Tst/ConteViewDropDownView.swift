//
//  ConteViewDropDownView.swift
//  testDropDown
//
//  Created by Emmanuel Zambrano on 21/03/25.
//

import UIKit

final class ConteViewDropDownView: UIView {
    
    lazy private var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy private var backGroundView: UIView = {
        let stack = UIView()
        stack.backgroundColor = .systemGray6
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.cornerRadius = 8
        return stack
    }()
    
    lazy private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy private var referenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.text = "Número de referencia"
        label.textColor = .black
        return label
    }()
    
    lazy private var numberReferenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy private var IconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "square.on.square")
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.tintColor = .systemPurple
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        fillView()
        addViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUPView(topText: String, refNumber: String) {
        topLabel.text = topText
        numberReferenceLabel.text = refNumber
    }
    
    func fillView() {
        addSubview(topLabel)
        addSubview(backGroundView)
        fillBackGroundView()
    }
    
    func fillBackGroundView() {
        containerView.addSubview(referenceLabel)
        containerView.addSubview(numberReferenceLabel)
        backGroundView.addSubview(IconImage)
        backGroundView.addSubview(containerView)
    }
    
    func addViewConstraint() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            IconImage.trailingAnchor.constraint(equalTo: backGroundView.trailingAnchor, constant: -16),
            IconImage.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            
            referenceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            referenceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            referenceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            numberReferenceLabel.topAnchor.constraint(equalTo: referenceLabel.bottomAnchor, constant: 8),
            numberReferenceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            numberReferenceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            numberReferenceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            
            containerView.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 16),
            containerView.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor),
            containerView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -10),
            
            backGroundView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 16),
            backGroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}

