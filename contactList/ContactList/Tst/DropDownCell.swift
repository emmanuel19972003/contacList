//
//  DropDownCell.swift
//  testDropDown
//
//  Created by Emmanuel Zambrano on 21/03/25.
//

import UIKit

protocol DropDownCellProtocol {
    func reloadTable()
}

final class DropDownCell: UITableViewCell {
    
    private lazy var dropDownHeader: DropDownView = {
        let view = DropDownView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var  cellLabel: ConteViewDropDownView = {
        let view = ConteViewDropDownView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(dropDownHeader)
        NSLayoutConstraint.activate([
            dropDownHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dropDownHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dropDownHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dropDownHeader.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func setUpCell(titleText: String,
                   imageIcon: String = "chevron.down",
                   bodyText: String,
                   refNumber: String,
                   delegate: DropDownCellProtocol) {
        cellLabel.setUPView(topText: bodyText, refNumber: refNumber)
        dropDownHeader.setInitialValues(titleText: titleText, displayContent: cellLabel, delegate: delegate)
        
    }
}

