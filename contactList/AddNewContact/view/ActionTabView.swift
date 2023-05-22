//
//  ActionTabView.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/21/23.
//

import UIKit

protocol ActionTabViewProtocol {
    func buttonOnTapped()
    func buttonTwoTapped()
    func buttonThreeTapped()
}

class ActionTabView: UIView {
    
    var delegate: ActionTabViewProtocol?
    
    @IBOutlet private var contentView: UIView!
    
    @IBOutlet var stackButtonOne: UIStackView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackButtonOneTapped))
            stackButtonOne.addGestureRecognizer(tapGesture)
            stackButtonOne.layer.cornerRadius = 10
            stackButtonOne.layer.shadowColor = UIColor.black.cgColor
            stackButtonOne.layer.shadowOpacity = 0.5
            stackButtonOne.layer.shadowOffset = .zero
            stackButtonOne.layer.shadowRadius = 2
        }
    }
    
    
    @IBOutlet var buttonOneImage: UIImageView!
    
    @IBOutlet var buttonOneLabel: UILabel!
    
    @IBOutlet var stackButtonTwo: UIStackView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackButtonTwoTapped))
            stackButtonTwo.addGestureRecognizer(tapGesture)
            stackButtonTwo.layer.cornerRadius = 10
            stackButtonTwo.layer.shadowColor = UIColor.black.cgColor
            stackButtonTwo.layer.shadowOpacity = 0.5
            stackButtonTwo.layer.shadowOffset = .zero
            stackButtonTwo.layer.shadowRadius = 2
        }
    }
    
    @IBOutlet var buttonTwoImage: UIImageView!
    
    @IBOutlet var buttonTwoLabel: UILabel!
    
    @IBOutlet var stackButtonThree: UIStackView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackButtonThreetapped))
            stackButtonThree.addGestureRecognizer(tapGesture)
            stackButtonThree.layer.cornerRadius = 10
            stackButtonThree.layer.shadowColor = UIColor.black.cgColor
            stackButtonThree.layer.shadowOpacity = 0.5
            stackButtonThree.layer.shadowOffset = .zero
            stackButtonThree.layer.shadowRadius = 2
        }
    }
    
    @IBOutlet var buttonThreeImage: UIImageView!
    
    @IBOutlet var buttonThreeLabel: UILabel!
    
    init(buttonOneImage: String? = nil, buttonOneLabel: String? = nil,
         buttonTwoImage: String? = nil, buttonTwoLabel: String? = nil,
         buttonThreeImage: String? = nil, buttonThreeLabel: String? = nil) {
        super.init(frame: .zero)
        loadView()
        setUpButtons(buttonOneImage: buttonOneImage, buttonOneLabel: buttonOneLabel,
                     buttonTwoImage: buttonTwoImage, buttonTwoLabel: buttonTwoLabel,
                     buttonThreeImage: buttonThreeImage, buttonThreeLabel: buttonThreeLabel)
        
    }
    
    private func loadView() {
        Bundle.main.loadNibNamed("ActionTabView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        loadView()
    }
    
    
    @objc func stackButtonOneTapped() {
        delegate?.buttonOnTapped()
    }
    
    @objc func stackButtonTwoTapped() {
        delegate?.buttonTwoTapped()
    }
    
    @objc func stackButtonThreetapped() {
        delegate?.buttonThreeTapped()
    }
    
    func setUpButtons(buttonOneImage: String?, buttonOneLabel: String?,
                      buttonTwoImage: String?, buttonTwoLabel: String?,
                      buttonThreeImage: String?, buttonThreeLabel: String?) {
        if let OneImage = buttonOneImage {
            self.buttonOneImage.image = UIImage(systemName: OneImage)
            self.buttonOneLabel.text = buttonOneLabel
        }
        
        if let TwoImage = buttonTwoImage {
            self.buttonTwoImage.image = UIImage(systemName: TwoImage)
            self.buttonTwoLabel.text = buttonTwoLabel
        }
        
        if let ThreeImage = buttonThreeImage {
            self.buttonThreeImage.image = UIImage(systemName: ThreeImage)
            self.buttonThreeLabel.text = buttonThreeLabel
        }
    }
    
}
