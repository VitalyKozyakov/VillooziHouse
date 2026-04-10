//
//  FavoriteTableView.swift.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 03.04.2026.
//

import UIKit

class FavoriteHouseVC: UIViewController, HouseCellDelegate {
    
    private var favoriteHouses: [House] = []
    private let dataSource: CatalogOfHousesDataSourse
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CatalogOfHousesCell.self, forCellReuseIdentifier: CatalogOfHousesCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Тут будут дома, которые вы добавили в избранное\n❤️"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemGray
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
        loadFavoritesFromUserDefaults()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavoritesFromUserDefaults()
        updateEmptyState()
    }
    
    init(
        dataSource: CatalogOfHousesDataSourse
    ) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewController() {
        title = "Избранные 🏡"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(emptyStateLabel)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyStateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyStateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func loadFavoritesFromUserDefaults() {
        let favoriteIds = UserDefaults.standard.array(forKey: "favoriteHouses") as? [String] ?? []
        
        let allProjects = dataSource.getHouse()
        
        var favorites: [House] = []
        for project in allProjects {
            for house in project.house where favoriteIds.contains(house.id) {
                var favoriteHouse = house
                favoriteHouse.isFavorite = true
                favorites.append(favoriteHouse)
            }
        }
        
        favoriteHouses = favorites
        tableView.reloadData()
        updateEmptyState()
    }
    
    private func updateEmptyState() {
        emptyStateLabel.isHidden = !favoriteHouses.isEmpty
        tableView.isHidden = favoriteHouses.isEmpty
    }
    
    private func saveFavoritesToUserDefaults() {
        let favoriteIds = favoriteHouses.map { $0.id }
        UserDefaults.standard.set(favoriteIds, forKey: "favoriteHouses")
    }
    
    func didToggleFavorite(in cell: CatalogOfHousesCell, state: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let house = favoriteHouses[indexPath.row]
        
        if !state {
            favoriteHouses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveFavoritesToUserDefaults()
            updateEmptyState()
        }
        
        updateFavoriteStatusInDataSource(houseId: house.id, isFavorite: state)
    }
    
    private func updateFavoriteStatusInDataSource(houseId: String, isFavorite: Bool) {
        var allProjects = dataSource.getHouse()
        
        for sectionIndex in 0..<allProjects.count {
            for rowIndex in 0..<allProjects[sectionIndex].house.count {
                if allProjects[sectionIndex].house[rowIndex].id == houseId {
                    allProjects[sectionIndex].house[rowIndex].isFavorite = isFavorite
                }
            }
        }
        
        dataSource.saveHouses(allProjects)
    }
}

extension FavoriteHouseVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteHouses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CatalogOfHousesCell.reuseIdentifier,
            for: indexPath
        ) as? CatalogOfHousesCell else {
            return UITableViewCell()
        }
        
        let house = favoriteHouses[indexPath.row]
        cell.configure(with: house)
        
        if house.imageGallery.isEmpty,
           let image = house.imageProject {
            if let uiImage = UIImage(named: image) {
                cell.configure(images: [uiImage])
            } else {
                cell.configure(images: [UIImage(systemName: "house.fill") ?? UIImage()])
            }
        } else {
            let uiImages = house.imageGallery.compactMap { UIImage(named: $0) }
            cell.configure(images: uiImages)
        }
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let house = favoriteHouses[indexPath.row]
        
        let houseImages: [UIImage]
        if house.imageGallery.isEmpty,
           let image = house.imageProject {
            if let uiImage = UIImage(named: image) {
                houseImages = [uiImage]
            } else {
                houseImages = [UIImage(systemName: "house.fill") ?? UIImage()]
            }
        } else {
            let uiImages = house.imageGallery.compactMap { UIImage(named: $0) }
            houseImages = uiImages
        }
        
        let calculatingVC = CalculatingTheHouseViewController(
            houseId: house.id,
            houseImage: UIImage(named: house.imageProject ?? ""),
            houseImages: houseImages
        )
        
        navigationController?.pushViewController(calculatingVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let house = favoriteHouses[indexPath.row]
            favoriteHouses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            updateFavoriteStatusInDataSource(houseId: house.id, isFavorite: false)
            
            var favoriteIds = UserDefaults.standard.array(forKey: "favoriteHouses") as? [String] ?? []
            favoriteIds.removeAll { $0 == house.id }
            UserDefaults.standard.set(favoriteIds, forKey: "favoriteHouses")
            
            updateEmptyState()
        }
    }
}

#Preview {
    let favoriteVC = FavoriteHouseVC(dataSource: CatalogOfHousesDataSourse())
    let navigationController = UINavigationController(rootViewController: favoriteVC)
    navigationController
}

