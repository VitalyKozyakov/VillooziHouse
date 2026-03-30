////
////  MainVilloziHouseCell.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 27.03.2026.
////
//
import UIKit
//

final class MainVilloziHouseCell: UITableViewCell {

    static let reuseIdentifier = "MainVilloziHouseCell"

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textMenuLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconLabel.text = nil
        textMenuLabel.text = nil
    }

    private func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        contentView.addSubview(containerView)
        containerView.addSubview(iconLabel)
        containerView.addSubview(textMenuLabel)
        containerView.addSubview(chevronImageView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

            iconLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            iconLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconLabel.widthAnchor.constraint(equalToConstant: 28),
            iconLabel.heightAnchor.constraint(equalToConstant: 28),

            chevronImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            chevronImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 10),
            chevronImageView.heightAnchor.constraint(equalToConstant: 14),

            textMenuLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            textMenuLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 10),
            textMenuLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -8),
            textMenuLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with model: MainVilloziHouseCellModel) {
        iconLabel.text = model.icon
        textMenuLabel.text = model.text
    }
}

//final class MainVilloziHouseCell: UITableViewCell {
//
//    static let reuseIdentifier: String = "MainVilloziHouseCell"
//
//    private let iconLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 32, weight: .bold)
//        return label
//    }()
//
//    private let textMenuLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 14, weight: .regular)
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//            setupView()
//        }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupView() {
//        contentView.addSubview(iconLabel)
//        contentView.addSubview(textMenuLabel)
//
//        iconLabel.translatesAutoresizingMaskIntoConstraints = false
//        textMenuLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            iconLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            iconLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            iconLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            iconLabel.heightAnchor.constraint(equalToConstant: 24),
//            iconLabel.widthAnchor.constraint(equalToConstant: 24),
//
//            textMenuLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
//            textMenuLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 4),
//            textMenuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
//            textMenuLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
//        ])
//        selectionStyle = .default
//        accessoryType = .disclosureIndicator
//    }
//
//    func configure(with model: MainVilloziHouseCellModel) {
//        iconLabel.text = model.icon
//        textMenuLabel.text = model.text
//    }
//}
//#Preview {
//    MainVilloziHouseVC()
//}
