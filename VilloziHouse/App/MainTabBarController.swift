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
                let catalogVC = CalculatingTheHouse()
        let catalogNav = UINavigationController(rootViewController: catalogVC)
        catalogNav.tabBarItem = UITabBarItem(
            title: "Проекты",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        // Вкладка 2: Избранное (заглушка)
        let favoritesVC = PlaceholderViewController(title: "Избранное", icon: "heart")
        let favoritesNav = UINavigationController(rootViewController: favoritesVC)
        favoritesNav.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        
        // Вкладка 3: Сравнение (заглушка)
        let compareVC = PlaceholderViewController(title: "Сравнение", icon: "square.split.2x1")
        let compareNav = UINavigationController(rootViewController: compareVC)
        compareNav.tabBarItem = UITabBarItem(
            title: "Сравнение",
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
        let applicationVC = ApplicationVC(houseName: "Заявка", totalPrice: 0)
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
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    }
}
