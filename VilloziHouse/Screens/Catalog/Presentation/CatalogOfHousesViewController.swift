import UIKit

class CatalogOfHousesViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let dataSource: CatalogOfHousesDataSourse
    private var allHouses: [House] = []
    private var filteredHouses: [House] = []
    private var currentCategoryIndex = 0
    
    private let categories = [
        "Все",
//        "до 50",
        "до 100м²",
//        "100-150м²",
        "100-200м²",
        "от 200м²"
    ]
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView =  UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CatalogOfHousesCell.self, forCellReuseIdentifier: CatalogOfHousesCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    
    private lazy var segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: categories)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(categoryChanged), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupUI()
        loadFavoriteStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    init(dataSource: CatalogOfHousesDataSourse) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view
    
    private func setupViewController() {
        title = "Каталог домов"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        view.addSubview(segmentControl)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Private methods
    
    private func filterHouses(by categoryIndex: Int) {
        let categoriesRanges = dataSource.getAreaCategories()
        let selectedRange = categoriesRanges[categoryIndex].range
        
        if let range = selectedRange {
            filteredHouses = allHouses.filter { house in
                return range.contains(house.area)
            }
            .sorted { $0.area < $1.area }
        } else {
            filteredHouses = allHouses
        }
        
        tableView.reloadData()
        
        if !filteredHouses.isEmpty {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    private func loadFavoriteStatus() {
        let favorites = UserDefaults.standard.array(forKey: "favoriteHouses") as? [String] ?? []
        
        allHouses = dataSource.getHouses()
        
        for index in 0..<allHouses.count {
            var house = allHouses[index]
            house.isFavorite = favorites.contains(house.id)
            allHouses[index] = house
        }
        
        dataSource.saveHouses(allHouses)
        
        filterHouses(by: currentCategoryIndex)
    }
    
    private func updateData() {
        allHouses = dataSource.getHouses()
        filterHouses(by: currentCategoryIndex)
    }
    
    @objc private func categoryChanged() {
        currentCategoryIndex = segmentControl.selectedSegmentIndex
        filterHouses(by: currentCategoryIndex)
    }
    
    private func saveFavoriteStatus(for houseId: String, isFavorite: Bool) {
        var favorites = UserDefaults.standard.array(forKey: "favoriteHouses") as? [String] ?? []
        
        if isFavorite {
            if !favorites.contains(houseId) {
                favorites.append(houseId)
            }
        } else {
            favorites.removeAll { $0 == houseId }
        }
        
        UserDefaults.standard.set(favorites, forKey: "favoriteHouses")
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CatalogOfHousesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredHouses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogOfHousesCell.reuseIdentifier, for: indexPath) as? CatalogOfHousesCell else {
            return UITableViewCell()
        }
        
        let house = filteredHouses[indexPath.row]
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
        
        cell.onFavoriteTapped = { [weak self] isFavorite in
            guard let self = self else { return }
            
            let houseId = self.filteredHouses[indexPath.row].id
            self.saveFavoriteStatus(for: houseId, isFavorite: isFavorite)
            
            if let allIndex = self.allHouses.firstIndex(where: { $0.id == houseId }) {
                self.allHouses[allIndex].isFavorite = isFavorite
            }
            
            self.filteredHouses[indexPath.row].isFavorite = isFavorite
            self.dataSource.saveHouses(self.allHouses)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
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
        
        guard indexPath.row < filteredHouses.count else { return }
        
        let house = filteredHouses[indexPath.row]
        
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
}


#Preview(traits: .portrait) {
    let dataSource = CatalogOfHousesDataSourse()
    let homeVC = CatalogOfHousesViewController(dataSource: dataSource)
    let navigationController = UINavigationController(rootViewController: homeVC)
    return navigationController
}
