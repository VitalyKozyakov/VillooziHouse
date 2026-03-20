//
//  CalculatingTheHouseCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

class CalculatingTheHouseCell: UITableViewCell {
    
    static let identifier = "CalculatingTheHouseCell"
    
    private let nameMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceMaterialLabel: UILabel = {
        let label = UILabel()
        label.textColor = ConstantsColor.colorText
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
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
    private var isRadio = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameMaterialLabel.text = nil
        priceMaterialLabel.text = nil
        selectButton.tintColor = .lightGray
    }
    
    
    func configure(
        with option: CalculatingTheHouseViewController.FinishingOption,
        selectionType: CalculatingTheHouseViewController.Category.Selection,
        isSelected: Bool
    ) {
        nameMaterialLabel.text = option.title
        priceMaterialLabel.text = formatPrice(Int(option.deltaRub))
        
        isRadio = (selectionType == .single)
        setSelected(isSelected)
    }
    
    private func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = "."
        formatter.minusSign = "-"
        
        if let formattedPrice = formatter.string(from: NSNumber(value: price)) {
            return "+ \(formattedPrice) ₽"
        }
        return "\(price) ₽"
    }
    
    func setSelected(_ selected: Bool) {
        let imageName: String
        if isRadio {
            imageName = selected ? "circle.fill" : "circle"
        } else {
            imageName = selected ? "square.fill" : "square"
        }
        selectButton.setImage(UIImage(systemName: imageName), for: .normal)
        selectButton.tintColor = selected ? .systemBlue : .lightGray
    }
    
    private func setupCell() {
        contentView.addSubview(nameMaterialLabel)
        contentView.addSubview(priceMaterialLabel)
        contentView.addSubview(selectButton)
        
        NSLayoutConstraint.activate([
            selectButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            selectButton.heightAnchor.constraint(equalToConstant: 24),
            selectButton.widthAnchor.constraint(equalToConstant: 24),
            
            nameMaterialLabel.leadingAnchor.constraint(equalTo: selectButton.trailingAnchor, constant: 8),
            nameMaterialLabel.trailingAnchor.constraint(equalTo: priceMaterialLabel.leadingAnchor, constant: -12),
            nameMaterialLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameMaterialLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            priceMaterialLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            priceMaterialLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        selectButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        priceMaterialLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        priceMaterialLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        nameMaterialLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameMaterialLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
    }
    @objc private func buttonTapped() {
//        isSelectedState.toggle()
//        setSelected(isSelectedState)
//        onSelect?(isSelectedState)
    }
}
#Preview {
    CalculatingTheHouseViewController()
}

//высота ячейки = размер элемента(14)
