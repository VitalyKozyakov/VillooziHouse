//
//  CalculatingTheHouseCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

class CalculatingTheHouseCell: UITableViewCell {
    
    static let reuseId = "CalculatingTheHouseCell"
    
    private let nameMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private let priceMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    private let selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var onSelect: ((Bool) -> Void)?
    private var isSelectedState = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCell() {
        contentView.addSubview(nameMaterialLabel)
        contentView.addSubview(priceMaterialLabel)
        contentView.addSubview(selectButton)
        
        NSLayoutConstraint.activate([
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            selectButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameMaterialLabel.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: -8),
            nameMaterialLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceMaterialLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceMaterialLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
