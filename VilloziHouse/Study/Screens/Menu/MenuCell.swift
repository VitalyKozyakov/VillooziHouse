//
//  MenuCell.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//

import UIKit

final class MenuCell: UITableViewCell {

    static let reuseId = "MenuCell"

    // MARK: - UI

    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .systemGray5
        iv.image = UIImage(systemName: "cup.and.saucer.fill")
        iv.tintColor = .systemGray3
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let categoryLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 11, weight: .semibold)
        l.textColor = .white
        l.backgroundColor = .systemBrown
        l.layer.cornerRadius = 6
        l.clipsToBounds = true
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        l.numberOfLines = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let descriptionLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13)
        l.textColor = .secondaryLabel
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let priceLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 15, weight: .bold)
        l.textColor = .systemBrown
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let caloriesLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 12)
        l.textColor = .tertiaryLabel
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let addButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        b.tintColor = .systemBrown
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    private let unavailableLabel: UILabel = {
        let l = UILabel()
        l.text = "Недоступно"
        l.font = .systemFont(ofSize: 11)
        l.textColor = .systemRed
        l.isHidden = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    // MARK: - Public

    var onAddTapped: (() -> Void)?

    func configure(with item: MenuItem) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        priceLabel.text = item.price.formattedAsPrice()
        caloriesLabel.text = "\(item.calories) ккал"
        categoryLabel.text = "  \(item.category)  "
        addButton.isHidden = !item.isAvailable
        unavailableLabel.isHidden = item.isAvailable
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - prepareForReuse

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        priceLabel.text = nil
        caloriesLabel.text = nil
        categoryLabel.text = nil
        onAddTapped = nil
        addButton.isHidden = false
        unavailableLabel.isHidden = true
    }

    // MARK: - Actions

    @objc private func addTapped() { onAddTapped?() }

    // MARK: - Layout

    private func setupUI() {
        selectionStyle = .none
        [photoImageView, categoryLabel, titleLabel,
         descriptionLabel, priceLabel, caloriesLabel,
         addButton, unavailableLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoImageView.widthAnchor.constraint(equalToConstant: 72),
            photoImageView.heightAnchor.constraint(equalToConstant: 72),
            photoImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12),

            categoryLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 12),

            titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -8),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12),

            caloriesLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            caloriesLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),

            unavailableLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            unavailableLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),

            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 36),
            addButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
}
