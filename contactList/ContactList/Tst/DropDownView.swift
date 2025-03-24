//
//  DropDownView.swift
//  testDropDown
//
//  Created by Emmanuel Zambrano on 20/03/25.
//

import UIKit

final public class DropDownView: UIView {
    
    private var isDisplayingContent: Bool = false
    
    var delegate: DropDownCellProtocol?
    
    var displayContent: UIView?
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        return stack
    }()
    
    lazy private var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addChildViews()
        addConstraint()
        fillMainStack()
        fillButomStaStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInitialValues(titleText: String,
                          imageIcon: String = "chevron.down",
                          displayContent: UIView,
                          delegate: DropDownCellProtocol) {
        self.delegate = delegate
        self.displayContent = displayContent
        titleLabel.text = titleText
        arrowIcon.image = UIImage(systemName: imageIcon)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        fillButomStaStack()
    }
    
    private func setInitialValues(titleText: String,
                                  imageIcon: UIImage,
                                  displayContent: UIView) {
        self.displayContent = displayContent
        titleLabel.text = titleText
        arrowIcon.image = imageIcon
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        fillButomStaStack()
    }
    
    @inline(__always)
    @objc func tapGesture() {
        self.isDisplayingContent.toggle()
        displayContent?.isHidden = !isDisplayingContent
        UIView.animate(withDuration: 0.5, animations: {
            self.arrowIcon.transform = CGAffineTransform(rotationAngle: self.isDisplayingContent ? .pi : 0)
        })
        delegate?.reloadTable()
    }
    
    private func fillMainStack() {
        mainStack.addArrangedSubview(topStack)
        topStack.addArrangedSubview(titleLabel)
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        topStack.addArrangedSubview(spacer)
        topStack.addArrangedSubview(arrowIcon)
        
    }
    
    func fillButomStaStack() {
        guard let displayContent = displayContent else {return}
        displayContent.isHidden = true
        mainStack.addArrangedSubview(displayContent)
    }
    
    
    private func addChildViews() {
        self.addSubview(mainStack)
    }
    private func addConstraint() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
}

