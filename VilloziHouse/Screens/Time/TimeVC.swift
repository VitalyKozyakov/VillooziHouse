//
//  TimeVC.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 13.04.2026.
//

import UIKit

class TimeVC: UIViewController {
    
    let stroyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "127-14-01")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        return imageView
    }()
    
    let listWorkLabel: UILabel = {
        let label = UILabel()
        label.text = "Страница в разработке"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оставить заявку", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let contactButton: UIButton = {
        let button = UIButton()
        button.setTitle("Контакты", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configuration()
    }
    
    private func setupUI() {
        [stroyImage, listWorkLabel, applyButton, contactButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
    }
    
    private func configuration() {
        NSLayoutConstraint.activate([
            stroyImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
            stroyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stroyImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stroyImage.heightAnchor.constraint(equalToConstant: 240),
            
            listWorkLabel.topAnchor.constraint(equalTo: stroyImage.bottomAnchor, constant: 16),
            listWorkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            listWorkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            applyButton.topAnchor.constraint(equalTo: listWorkLabel.bottomAnchor, constant: 24),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            contactButton.topAnchor.constraint(equalTo: applyButton.bottomAnchor, constant: 24),
            contactButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            contactButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
            ])
    }
    
    @objc private func applyButtonTapped() {
        let totalPrice = 0.0
        let formattedPrice = "0"
        
        let applicationVC = ApplicationVC(
                houseName: "Мой дом",
                totalPrice: totalPrice,
                formattedPrice: formattedPrice
        )
        navigationController?.pushViewController(applicationVC, animated: true)
    }
}
#Preview(traits: .portrait) {
    TimeVC()
}

