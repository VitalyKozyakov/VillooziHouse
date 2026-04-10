//
//  CartViewController.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//

import UIKit

final class CartViewController: UIViewController {

    // MARK: - UI

    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 60
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private let emptyLabel: UILabel = {
        let l = UILabel()
        l.text = "Корзина пуста"
        l.font = .systemFont(ofSize: 16)
        l.textColor = .secondaryLabel
        l.textAlignment = .center
        l.isHidden = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let footerView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let totalLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let orderButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Оформить заказ", for: .normal)
        b.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .systemBrown
        b.layer.cornerRadius = 12
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Корзина"
        view.backgroundColor = .systemBackground
        setupLayout()
        updateUI()
    }

    // MARK: - Setup

    private func setupLayout() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CartCell")
        tableView.dataSource = self
        tableView.delegate   = self

        view.addSubview(tableView)
        view.addSubview(emptyLabel)
        view.addSubview(footerView)
        footerView.addSubview(totalLabel)
        footerView.addSubview(orderButton)

        orderButton.addTarget(self, action: #selector(orderTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 110),

            totalLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 12),
            totalLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),

            orderButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 8),
            orderButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            orderButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            orderButton.heightAnchor.constraint(equalToConstant: 50),

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor),

            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func updateUI() {
        let isEmpty = Cart.shared.items.isEmpty
        emptyLabel.isHidden = !isEmpty
        tableView.isHidden  = isEmpty
        orderButton.isEnabled = !isEmpty
        orderButton.alpha = isEmpty ? 0.4 : 1.0
        totalLabel.text = "Итого: \(Cart.shared.total.formattedAsPrice())"
        tableView.reloadData()
    }

    // MARK: - Actions

    @objc private func orderTapped() {
//        let vc = OrderFormViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Cart.shared.items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        let item = Cart.shared.items[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = item.title
        config.secondaryText = item.price.formattedAsPrice()
        cell.contentConfiguration = config
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] _, _, done in
            let item = Cart.shared.items[indexPath.row]
            Cart.shared.remove(item)
            self?.updateUI()
            done(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}




