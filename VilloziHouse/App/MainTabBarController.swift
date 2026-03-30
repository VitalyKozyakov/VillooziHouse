//
//  MainTabBarController.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.02.2026.
//


import UIKit

final class MainTabBarController: UITabBarController {
    
    // =========================================================================
    // MARK: - Жизненный цикл
    // =========================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
    }
    
    // =========================================================================
    // MARK: - Настройка вкладок
    // =========================================================================
    
    private func setupTabs() {
        // 📚 Создаём каждый экран и оборачиваем в NavigationController.
        //    NavigationController даёт нам:
        //    • Кнопку "Назад" при переходе вглубь
        //    • Заголовок экрана (navigationItem.title)
        //    • Возможность push/pop между экранами
        
        // Вкладка 1: Каталог проектов
                let catalogVC = MainVilloziHouseVC()
        let catalogNav = UINavigationController(rootViewController: catalogVC)
        catalogNav.tabBarItem = UITabBarItem(
            title: "Главная",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        // Вкладка 2: Избранное (заглушка)
        let favoritesVC = CatalogOfHousesViewController()
        let favoritesNav = UINavigationController(rootViewController: favoritesVC)
        favoritesNav.tabBarItem = UITabBarItem(
            title: "Проекты",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        
        // Вкладка 3: Сравнение (заглушка)
        let defaultHouseId = "124-14"
        let compareVC = CalculatingTheHouseViewController(houseId: defaultHouseId)
        let compareNav = UINavigationController(rootViewController: compareVC)
        compareNav.tabBarItem = UITabBarItem(
            title: "Расчет",
            image: UIImage(systemName: "square.split.2x1"),
            selectedImage: UIImage(systemName: "square.split.2x1.fill")
        )
        
        // Вкладка 4: Профиль (заглушка)
        let profileVC = PlaceholderViewController(title: "Профиль", icon: "person")
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        let applicationVC = ApplicationVC(houseName: "Заявка", totalPrice: 0, formattedPrice: "ценник 70")
        let applicationNav = UINavigationController(rootViewController: applicationVC)
        applicationNav.tabBarItem = UITabBarItem(
            title: "Заявка",
            image: UIImage(systemName: "pencil"),
            selectedImage: UIImage(systemName: "pencil.fill")
        )
        // 📚 Устанавливаем массив дочерних контроллеров.
        //    Порядок в массиве = порядок вкладок слева направо.
        viewControllers = [catalogNav, favoritesNav, compareNav, profileNav, applicationNav]
    }
    
    // =========================================================================
    // MARK: - Внешний вид TabBar
    // =========================================================================
    
    private func setupAppearance() {
        // 📚 UITabBarAppearance — настройка внешнего вида TabBar
        let appearance = UITabBarAppearance()
        title = "VilloziHouse"
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    }
}
