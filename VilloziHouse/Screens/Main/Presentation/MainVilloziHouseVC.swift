////
////  MainVilloziHouseVC.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 24.03.2026.
////
import UIKit

final class MainVilloziHouseVC: UIViewController {
    private let dataSource: CatalogOfHousesDataSourse
    
    private let topMenuItems: [MainVilloziHouseCellModel] = [
        .news,
        .project,
        .reviews,
        .about,
        .nedom,
        .designing,
        .mortgage,
        .video,
        .map,
        .ownProduction,
        .contacts
    ]
    
    private let bottomMenuItems: [MainVilloziHouseCellModel] = [
        .favourites,
        .documents,
        .progressOfWork,
        .assignedPastMeetings
    ]
    
    private lazy var menuSections: [[MainVilloziHouseCellModel]] = [
        topMenuItems,
        bottomMenuItems
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        //        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoVilloziBlack")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo1VilloziRussia")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "project127-14-01")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tvImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvVillozi")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mapImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = true
        //                title = "Villozi House"
        
        setupTableView()
        setupHeaderView()
        
        loadHousesWithDelay(completion: { houses in
            print("houses \(houses)")
        })
    }
    
    init(dataSource: CatalogOfHousesDataSourse
    ) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if tableView.tableHeaderView == nil {
            let size = headerContainerView.systemLayoutSizeFitting(
                CGSize(width: tableView.bounds.width, height: UIView.layoutFittingCompressedSize.height),
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
            
            headerContainerView.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: size.height)
            tableView.tableHeaderView = headerContainerView
        }
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainVilloziHouseCell.self, forCellReuseIdentifier: MainVilloziHouseCell.reuseIdentifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func setupHeaderView() {
        headerContainerView.addSubview(cardView)
        
        //        headerContainerView.addSubview(tvImageView)
        //        headerContainerView.addSubview(mapImageView)
        
        cardView.addSubview(logoImageView)
        cardView.addSubview(titleImageView)
        cardView.addSubview(profileView)
        headerContainerView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            //            cardView.heightAnchor.constraint(equalToConstant: 80),
            
            logoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 4),
            logoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 4),
            logoImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -4),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            
            titleImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 4),
            titleImageView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: -4),
            titleImageView.trailingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: -4),
            titleImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -4),
            //            titleImageView.heightAnchor.constraint(equalToConstant: 40),
            //            titleImageView.widthAnchor.constraint(equalToConstant: 300),
            
            profileView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 4),
            profileView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -4),
            profileView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -4),
            profileView.widthAnchor.constraint(equalToConstant: 60),
            profileView.heightAnchor.constraint(equalToConstant: 60),
            
            bannerImageView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 4),
            bannerImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 4),
            bannerImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -4),
            bannerImageView.heightAnchor.constraint(equalToConstant: 200),
            bannerImageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: -4)
            
            
        ])
        
        //        let width = view.bounds.width
        //        headerContainerView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        print("tableView width =", tableView.bounds.width)
        //        tableView.tableHeaderView = headerContainerView
        //        headerContainerView.layoutIfNeeded()
    }
    
    private func handleSelection(_ item: MainVilloziHouseCellModel) {
        switch item {
        case .project:
            navigateToCatalogOfHouses()
        case .news:
            print("Новости")
        case .reviews:
            print("Отзывы")
        case .about:
            print("О нас")
        case .nedom:
            print("Недом")
        case .designing:
            print("Проектирование")
        case .mortgage:
            print("Ипотека")
        case .video:
            print("Видеонаблюдение")
        case .map:
            print("Карта построенных домов")
        case .ownProduction:
            print("Собственное производство")
        case .contacts:
            print("Контакты")
        case .favourites:
            print("Избранное")
        case .documents:
            print("Документы")
        case .progressOfWork:
            print("Ход работ")
        case .assignedPastMeetings:
            print("Назначенные/Прошедшие встречи")
        }
    }
    
    
    private func navigateToCatalogOfHouses() {
        let catalogVC = CatalogOfHousesViewController(dataSource: dataSource)
        navigationController?.pushViewController(catalogVC, animated: true)
    }
    // как-то так
    func loadHousesWithDelay(completion: @escaping ([House]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
            let houses: [House] = [
                House(id: "1", name: "new", dimensions: "10 * 10", area: 100, bedrooms: 8, price: 1900000, imageProject: "127-14-1"),
                House(id: "2", name: "new", dimensions: "10 * 10", area: 100, bedrooms: 8, price: 1900000, imageProject: "127-14-1"),
                House(id: "3", name: "new", dimensions: "10 * 10", area: 100, bedrooms: 8, price: 1900000, imageProject: "127-14-1")
            ]
            
            DispatchQueue.main.async {
                completion(houses)
            }
        }
    }
    
}
extension MainVilloziHouseVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        menuSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainVilloziHouseCell.reuseIdentifier,
            for: indexPath
        ) as? MainVilloziHouseCell else {
            return UITableViewCell()
        }
        
        let item = menuSections[indexPath.section][indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension MainVilloziHouseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let item = menuSections[indexPath.section][indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
        handleSelection(item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        section == 0 ? 8 : 20
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = .clear
//        return view
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

#Preview("Main Villozi House") {
    let dataSource = CatalogOfHousesDataSourse()
    let vc = MainVilloziHouseVC(dataSource: dataSource)
    return UINavigationController(rootViewController: vc)
}



