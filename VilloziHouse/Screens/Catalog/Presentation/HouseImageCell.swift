//
//  HouseImageCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 25.03.2026.
//

import UIKit

protocol HouseImageCellDelegate: AnyObject {
    func didTapImage(at index: Int)
}
// ШАГ 1 - создали ячеку для размещения в ней картин
final class HouseImageCell: UICollectionViewCell {
    
    static let identifier = "HouseImageCell"
    
    weak var delegate: HouseImageCellDelegate?
        private var currentIndex: Int = 0
    
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
        setupTapGesture()
        
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
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        houseImageView.addGestureRecognizer(tapGesture)
            }
            
            @objc private func imageTapped() {
                delegate?.didTapImage(at: currentIndex)
                    }
    // Сюда мы отправляем картинку houseImageView
    func configure(with image: UIImage?) {
        houseImageView.image = image
    }
}
