//
//  MenuViewController.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//

import UIKit

final class MenuViewController: UIViewController {

    // MARK: - Dependencies

    private let service: MenuServiceProtocol

    init(service: MenuServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Data

    private var allItems: [MenuItem] = []
    private var searchText: String = ""

    private var filteredItems: [MenuItem] {
        guard !searchText.isEmpty else { return allItems }
        return allItems.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    // MARK: - UI

    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 100
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Поиск по меню"
        sb.searchBarStyle = .minimal
        return sb
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.hidesWhenStopped = true
        ai.translatesAutoresizingMaskIntoConstraints = false
        return ai
    }()

    private lazy var cartButton: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(systemName: "cart"),
                        style: .plain, target: self,
                        action: #selector(cartTapped))
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Меню"
        view.backgroundColor = .systemBackground
        setupTableView()
        setupActivityIndicator()
        navigationItem.rightBarButtonItem = cartButton
        loadMenu()
        subscribeToCart()
        
        let available = allItems.filter { $0.isAvailable }
        let lowCalorie = allItems.filter { $0.calories < 200 }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCartBadge()
    }

    // MARK: - Setup

    private func setupTableView() {
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseId)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.tableHeaderView = searchBar
        searchBar.sizeToFit()
        searchBar.delegate = self

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func subscribeToCart() {
        Cart.shared.onUpdated = { [weak self] in
            DispatchQueue.main.async { self?.updateCartBadge() }
        }
    }

    private func updateCartBadge() {
        let count = Cart.shared.count
        cartButton.image = UIImage(systemName: count > 0 ? "cart.fill" : "cart")
        tabBarController?.viewControllers?[1].tabBarItem.badgeValue = count > 0 ? "\(count)" : nil
    }

    // MARK: - Data Loading

    private func loadMenu() {
        activityIndicator.startAnimating()
        service.fetchMenu { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                switch result {
                case .success(let items):
                    self.allItems = items
                    self.tableView.reloadData()
                case .failure:
                    self.showError()
                }
            }
        }
    }

    private func showError() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Не удалось загрузить меню",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить", style: .default) { [weak self] _ in
            self?.loadMenu()
        })
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }

    // MARK: - Actions

    @objc private func cartTapped() {
        let cartVC = CartViewController()
        navigationController?.pushViewController(cartVC, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredItems.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MenuCell.reuseId, for: indexPath
        ) as? MenuCell else { return UITableViewCell() }

        let item = filteredItems[indexPath.row]
        cell.configure(with: item)
        cell.onAddTapped = { [weak self] in
            guard let self = self else { return }
            Cart.shared.add(item)
            self.showAddedFeedback(for: indexPath)
        }
        return cell
    }

    private func showAddedFeedback(for indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        UIView.animate(withDuration: 0.1, animations: {
            cell.contentView.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.1) { cell.contentView.alpha = 1 }
        }
    }
}

// MARK: - UITableViewDelegate

extension MenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = filteredItems[indexPath.row]
//        let detailVC = MenuDetailViewController(item: item)
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension MenuViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
