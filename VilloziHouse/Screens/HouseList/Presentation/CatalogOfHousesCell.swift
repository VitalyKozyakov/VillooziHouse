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
    private var isFavorite: Bool = false
    
    
    // MARK: - UI
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.74, green: 0.9, blue: 0.78, alpha: 1.0)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let imageViewHouse: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.tintColor = .systemGray3
        imageView.contentMode = .center
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let nameHouseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
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
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .systemGreen
        return button
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewHouse.image = nil
        isFavorite = false
        updateFavoriteButton(isFavorite: false)
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(cardView)
        
        [imageViewHouse, nameHouseLabel, squareLabel, infoHouseLabel, priceHouseLabel, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            cardView.addSubview($0)
        }
    }
    func getHouseImage() -> UIImage? {
            return imageViewHouse.image
        }
    
    private func updateFavoriteButton(isFavorite: Bool) {
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            imageViewHouse.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageViewHouse.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            imageViewHouse.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            imageViewHouse.heightAnchor.constraint(equalToConstant: 200),
            
            favoriteButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            favoriteButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            favoriteButton.widthAnchor.constraint(equalToConstant: 32),
            favoriteButton.heightAnchor.constraint(equalToConstant: 32),
            
            
            nameHouseLabel.topAnchor.constraint(equalTo: imageViewHouse.bottomAnchor, constant: 8),
            nameHouseLabel.leadingAnchor.constraint(equalTo: imageViewHouse.leadingAnchor),
            nameHouseLabel.trailingAnchor.constraint(equalTo: imageViewHouse.trailingAnchor),
            
            squareLabel.topAnchor.constraint(equalTo: nameHouseLabel.bottomAnchor, constant: 4),
            squareLabel.leadingAnchor.constraint(equalTo: imageViewHouse.leadingAnchor),
            squareLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
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
    
    @objc private func favoriteTapped() {
        isFavorite.toggle()
        updateFavoriteButton(isFavorite: isFavorite)
        delegate?.didToggleFavorite(in: self, state: isFavorite)
    }
    
    func configure(with house: House) {
        isFavorite = house.isFavorite
        nameHouseLabel.text = house.name
        squareLabel.text = "📐 \(house.formattedArea) м²"
        infoHouseLabel.text = " \(house.formattedRooms) | \(house.dimensions)"
        priceHouseLabel.text = house.formattedPrice
        updateFavoriteButton(isFavorite: isFavorite)
        
        if let imageProject = house.imageProject,
           let image = UIImage(named: imageProject) {
            imageViewHouse.image = image
            imageViewHouse.contentMode = .scaleAspectFill
        } else {
            imageViewHouse.image = UIImage(systemName: "house.fill")
            imageViewHouse.contentMode = .scaleAspectFit
        }
    }
}
#Preview {
    let viewController = CatalogOfHousesViewController()
    return viewController
}
