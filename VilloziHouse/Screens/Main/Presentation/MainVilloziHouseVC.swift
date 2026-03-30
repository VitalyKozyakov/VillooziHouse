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
        return view
    }()

    private let headingView: UIView = {
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
        view.layer.cornerRadius = 50
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "project0124")
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Villozi House"

        setupTableView()
        setupHeaderView()
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainVilloziHouseCell.self, forCellReuseIdentifier: MainVilloziHouseCell.reuseIdentifier)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupHeaderView() {
        headerContainerView.addSubview(headingView)
        headingView.addSubview(logoImageView)
        headingView.addSubview(titleImageView)
        headingView.addSubview(profileView)
        headerContainerView.addSubview(bannerImageView)
        headerContainerView.addSubview(tvImageView)
        headerContainerView.addSubview(mapImageView)

        NSLayoutConstraint.activate([
            headingView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            headingView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            headingView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            headingView.heightAnchor.constraint(equalToConstant: 108),

            logoImageView.leadingAnchor.constraint(equalTo: headingView.leadingAnchor, constant: 12),
            logoImageView.bottomAnchor.constraint(equalTo: headingView.bottomAnchor, constant: -8),
            logoImageView.widthAnchor.constraint(equalToConstant: 56),
            logoImageView.heightAnchor.constraint(equalToConstant: 56),

            titleImageView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8),
            titleImageView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            titleImageView.trailingAnchor.constraint(lessThanOrEqualTo: profileView.leadingAnchor, constant: -8),
            titleImageView.heightAnchor.constraint(equalToConstant: 32),

            profileView.trailingAnchor.constraint(equalTo: headingView.trailingAnchor, constant: -12),
            profileView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            profileView.widthAnchor.constraint(equalToConstant: 52),
            profileView.heightAnchor.constraint(equalToConstant: 52),

            bannerImageView.topAnchor.constraint(equalTo: headingView.bottomAnchor, constant: 12),
            bannerImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 12),
            bannerImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -12),
            bannerImageView.heightAnchor.constraint(equalToConstant: 200),

            tvImageView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 16),
            tvImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 12),
            tvImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -12),
            tvImageView.heightAnchor.constraint(equalToConstant: 220),

            mapImageView.topAnchor.constraint(equalTo: tvImageView.bottomAnchor, constant: 12),
            mapImageView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 12),
            mapImageView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -12),
            mapImageView.heightAnchor.constraint(equalToConstant: 220),
            mapImageView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: -12)
        ])

        let width = view.bounds.width
        headerContainerView.frame = CGRect(x: 0, y: 0, width: width, height: 780)
        headerContainerView.layoutIfNeeded()
        tableView.tableHeaderView = headerContainerView
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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 8 : 20
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

#Preview {
    UINavigationController(rootViewController: MainVilloziHouseVC())
}



