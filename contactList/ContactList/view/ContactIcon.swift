//
//  ContactIcon.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/18/23.
//

import UIKit

class ContactIcon: UIView {
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        nameLabel.text = name
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(circleView)
        self.fillViewWith(circleView)
        
        
        self.addSubview(nameLabel)
        self.fillViewWith(nameLabel)
    }
}
