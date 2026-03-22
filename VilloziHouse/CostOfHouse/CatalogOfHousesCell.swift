//
//  CatalogOfHousesCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

protocol HouseCellDelegate: AnyObject {
    func didToggleFavorite(in cell: CatalogOfHousesCell, state: Bool)
}

final class CatalogOfHousesCell: UITableViewCell {
    
    static let reuseIdentifier: String = "CatalogOfHousesCell"
    weak var delegate: HouseCellDelegate?
    
    private let imageViewHouse: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private let nameHouseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let squareLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let infoHouseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    private let priceHouseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.backgroundColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        setupActions()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        [imageViewHouse, nameHouseLabel, squareLabel, infoHouseLabel, priceHouseLabel, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }

    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()


    @objc private func favoriteTapped() {
        let currentState = favoriteButton.imageView?.image == UIImage(systemName: "heart.fill")
            let newState = !currentState
            delegate?.didToggleFavorite(in: self, state: newState)
            updateFavoriteButton(isFavorite: newState)
        }
    
        func configure(with house: CatalogOfHousesDataSourse.House) {
            nameHouseLabel.text = house.name
            squareLabel.text = "📐 \(house.formattedArea) м²"
            infoHouseLabel.text = " \(house.formattedRooms) | \(house.dimensions)"
            priceHouseLabel.text = house.formattedPrice
            updateFavoriteButton(isFavorite: house.isFavorite)
            imageViewHouse.image = UIImage(systemName: "project2424")
            imageViewHouse.tintColor = .systemGray3
            imageViewHouse.contentMode = .center
            imageViewHouse.backgroundColor = .systemGray6
            
            if let image = UIImage(named: house.imageProject ?? "") {
                    imageViewHouse.image = image
                    imageViewHouse.contentMode = .scaleAspectFill
                    imageViewHouse.backgroundColor = .clear
                } else {
                    imageViewHouse.image = UIImage(systemName: "house.fill")
                    imageViewHouse.tintColor = .systemGray3
                    imageViewHouse.contentMode = .center
                    imageViewHouse.backgroundColor = .systemGray6
                }
        }
    private func updateFavoriteButton(isFavorite: Bool) {
            let imageName = isFavorite ? "heart.fill" : "heart"
            favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewHouse.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imageViewHouse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViewHouse.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageViewHouse.heightAnchor.constraint(equalToConstant: 200),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nameHouseLabel.topAnchor.constraint(equalTo: imageViewHouse.bottomAnchor, constant: 8),
            nameHouseLabel.leadingAnchor.constraint(equalTo: imageViewHouse.leadingAnchor),
            nameHouseLabel.trailingAnchor.constraint(equalTo: imageViewHouse.trailingAnchor),

            squareLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            squareLabel.leadingAnchor.constraint(equalTo: imageViewHouse.leadingAnchor),
            squareLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            squareLabel.widthAnchor.constraint(equalToConstant: 100),
            
            infoHouseLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            infoHouseLabel.leadingAnchor.constraint(equalTo: squareLabel.trailingAnchor, constant: 8),
            infoHouseLabel.bottomAnchor.constraint(equalTo: squareLabel.bottomAnchor),
            infoHouseLabel.widthAnchor.constraint(equalToConstant: 150),
            
            priceHouseLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            priceHouseLabel.leadingAnchor.constraint(equalTo: infoHouseLabel.trailingAnchor, constant: 8),
            priceHouseLabel.trailingAnchor.constraint(equalTo: imageViewHouse.trailingAnchor),
            priceHouseLabel.widthAnchor.constraint(equalToConstant: 150),
            priceHouseLabel.bottomAnchor.constraint(equalTo: squareLabel.bottomAnchor),
        ])
    }
    
    private func setupActions() {
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
    }
}
#Preview {
    let viewController = CatalogOfHousesView()
    return viewController
}
