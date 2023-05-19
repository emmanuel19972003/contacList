//
//  ContactsListTableViewCell.swift
//  contactList
//
//  Created by Emmanuel Zambrano Quitian on 5/17/23.
//

import UIKit

protocol ContactsListTableViewCellProtocol {
    func reloadCell(index: Int?)
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
    
    @IBOutlet weak var nameLabel: UILabel!
    
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
        }
    }
    
    @IBOutlet weak var descriptionTitleLabel: UILabel! {
        didSet {
            descriptionStackView.isHidden = true
            descriptionTitleLabel.text = "Number"
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.isHidden = true
            descriptionLabel.text = "Emma pero en descripcion"
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
        setIncon(iamge: image)
    }
    
    @objc func tapGesture() {
        divider.isHidden.toggle()
        descriptionStackView.isHidden.toggle()
        descriptionTitleLabel.isHidden.toggle()
        descriptionLabel.isHidden.toggle()
        arrowImage.rotateWithAnimation(descriptionStackView.isHidden)
        delegate?.reloadCell(index: cellrow)
        
    }
    
    func setIncon(iamge: String?) {
        
        if let image = iamge {
            
        } else {
            var icon = ContactIcon(name: self.na)
        }
    }
    
}
