//
//  HouseImageCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 25.03.2026.
//

import UIKit
// ШАГ 1 - создали ячеку для размещения в ней картин
final class HouseImageCell: UICollectionViewCell {
    static let identifier = "HouseImageCell"
    
    private let houseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(houseImageView)
        
        NSLayoutConstraint.activate([
            houseImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            houseImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            houseImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            houseImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Сюда мы отправляем картинку houseImageView
    func configure(with image: UIImage?) {
        houseImageView.image = image
    }
}
