//
//  ContactsListTableViewCell.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/17/23.
//

import UIKit

protocol ContactsListTableViewCellProtocol {
    func reloadCell()
    func editContactTaped(index: Int?)
}

class ContactsListTableViewCell: UITableViewCell {
    
    var delegate: ContactsListTableViewCellProtocol?
    var cellrow: Int?

    @IBOutlet weak var nameStackView: UIStackView! {
        didSet {
            nameStackView.isUserInteractionEnabled = true
            nameStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        }
    }
    
    @IBOutlet weak var viewHolder: UIView!
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        }
    }
    
    @IBOutlet weak var arrowImage: UIImageView! {
        didSet {
            arrowImage.contentMode = .scaleAspectFit
            arrowImage.image = UIImage(systemName: "chevron.down")
            arrowImage.tintColor = .systemGray
        }
    }
    
    
    @IBOutlet weak var divider: UIView! {
        didSet {
            divider.backgroundColor = .black
            divider.isHidden = true
        }
    }
    
    @IBOutlet weak var descriptionStackView: UIStackView! {
        didSet {
            descriptionStackView.isHidden = true
            descriptionStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(descriptionStackViewTaped)))
        }
    }
    
    @IBOutlet weak var descriptionTitleLabel: UILabel! {
        didSet {
            descriptionTitleLabel.isHidden = true
            descriptionTitleLabel.text = "Number: "
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.isHidden = true
        }
    }
    
    
    @IBOutlet weak var editArrow: UIImageView! {
        didSet {
            editArrow.isHidden = true
            editArrow.contentMode = .scaleAspectFit
            editArrow.image = UIImage(systemName: "chevron.forward.circle")
            editArrow.tintColor = .systemBlue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell (name: String, number: String, image: String?, cellrow: Int){
        nameLabel.text = name
        descriptionLabel.text = number
        self.cellrow = cellrow
        setIncon(name: name, iamge: image)
    }
    
    @objc func tapGesture() {
        divider.isHidden.toggle()
        descriptionStackView.isHidden.toggle()
        descriptionTitleLabel.isHidden.toggle()
        descriptionLabel.isHidden.toggle()
        arrowImage.rotateWithAnimation(descriptionStackView.isHidden)
        editArrow.isHidden.toggle()
        delegate?.reloadCell()
        
    }
    
    @objc func descriptionStackViewTaped() {
        delegate?.editContactTaped(index: cellrow)
    }
        
    func setIncon(name: String, iamge: String?) {
        
        let initial = Array(name)[0]
        let icon = ContactIcon(name: String(initial))
        viewHolder.fillViewWith(icon)
        icon.setCornerRadius(radius: viewHolder.layer.bounds.width / 2)
        
    }
    
}
