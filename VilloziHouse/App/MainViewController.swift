////
////  MainViewController.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 24.03.2026.
////
//
//import SWRevealViewController
//
//class MainViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Настройка кнопки меню
//        if let revealVC = revealViewController() {
//            navigationItem.leftBarButtonItem = UIBarButtonItem(
//                image: UIImage(systemName: "line.horizontal.3"),
//                style: .plain,
//                target: revealVC,
//                action: #selector(revealVC.revealToggle(_:))
//            )
//            
//            // Добавляем жест для открытия меню
//            view.addGestureRecognizer(revealVC.panGestureRecognizer())
//        }
//    }
//}
//
//// В SceneDelegate или AppDelegate настройка:
//func setupSideMenu() {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    
//    let frontVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//    let rearVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
//    
//    let revealVC = SWRevealViewController(rearViewController: rearVC, frontViewController: frontVC)
//    revealVC?.rearViewRevealWidth = 280
//    revealVC?.rearViewRevealOverdraw = 0
//    revealVC?.bounceBackOnOverdraw = false
//    
//    window?.rootViewController = revealVC
//}
