//
//  PlaceholderViewController.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.02.2026.
//

import UIKit

final class PlaceholderViewController: UIViewController {
    
    private let iconName: String
    
    // 📚 Кастомный init — принимает title и iconName
    init(title: String, icon: String) {
        self.iconName = icon
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Иконка по центру
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .light)
        imageView.image = UIImage(systemName: iconName, withConfiguration: config)
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Раздел в разработке"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: - Pizza closure example
    
    lazy var buttonOrderPizza: UIButton = { //1.
        let button = UIButton(type: .system)
        button.setTitle("Order Pizza", for: .normal)
        button.addTarget(self, action: #selector(didTapMakeOrder), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func didTapMakeOrder() { //2.
        let arr = [1, 2, 3, 4]
        arr.filter { $0 > 2 }
        
        makeOrder(
            type: "Peperoni",
            onReady: {
                print("Hooray, eating yammy pizza") // 13
            }
        ) // 3
    }
    
    func makeOrder(type: String, onReady: @escaping (() -> Void)) { //3.1
        print("Kassir accepted payment") // 4
        
        cookPizza(type: type) { type in //5
            print("Officiant: Pizza \(type) is ready. serving it") // 11
            
            onReady() //12
        }
    }
    
    func cookPizza(type: String, completion: @escaping (String) -> Void) { //6
        print("Cooker: Cooking pizza \(type)") //7
        
        // Cooking imititaion
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) { //8
            print("Cooker: Pizza is ready") //9
            
            completion(type) //10
        }
    }
    
    
    let buttonPizza: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        return button
    }()
    private func didTapOrderPizza() {
        buttonPizza.backgroundColor = .green
    }
}
