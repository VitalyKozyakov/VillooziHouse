////
////  MainVilloziHouseVC.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 24.03.2026.
////
import UIKit

final class MainVilloziHouseVC: UIViewController {
    
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
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
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
        view.layer.cornerRadius = 20
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func setupHeaderView() {
//        headerContainerView.addSubview(cardView)
        
//        headerContainerView.addSubview(tvImageView)
//        headerContainerView.addSubview(mapImageView)
        
        headerContainerView.addSubview(logoImageView)
        headerContainerView.addSubview(titleImageView)
        headerContainerView.addSubview(profileView)
        headerContainerView.addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 8),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 60),

            titleImageView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            titleImageView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 4),
            titleImageView.heightAnchor.constraint(equalToConstant: 40),
//            titleImageView.widthAnchor.constraint(equalToConstant: 100),

            profileView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            profileView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -8),
            profileView.widthAnchor.constraint(equalToConstant: 40),
            profileView.heightAnchor.constraint(equalToConstant: 40),

            bannerImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 4),
            bannerImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 4),
            bannerImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -4),
            bannerImageView.heightAnchor.constraint(equalToConstant: 300),
            bannerImageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
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
            print("Проекты домов")
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

#Preview {
    UINavigationController(rootViewController: MainVilloziHouseVC())
}



