////
////  MainVilloziHouseVC.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 24.03.2026.
////
//import UIKit
//
//class MainVilloziHouseVC: UIViewController {
//    
//    // MARK: - Properties
//        private var isMenuOpen = false
//        private let menuWidth: CGFloat = 280
//        private let animationDuration: TimeInterval = 0.3
//        
//        private lazy var menuViewController: UIViewController = {
//            let menuVC = MenuContentViewController() // Ваш контроллер с содержимым меню
//            return menuVC
//        }()
//        
//        private lazy var dimmingView: UIView = {
//            let view = UIView()
//            view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//            view.alpha = 0
//            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeMenu)))
//            return view
//        }()
//        
//        private var menuLeadingConstraint: NSLayoutConstraint!
//        
//        // MARK: - Lifecycle
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            setupMenu()
//            setupGestures()
//        }
//        
//        // MARK: - Setup
//        private func setupMenu() {
//            // Добавляем затемняющий view
//            view.addSubview(dimmingView)
//            dimmingView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
//                dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//            
//            // Добавляем меню
//            addChild(menuViewController)
//            view.addSubview(menuViewController.view)
//            menuViewController.view.translatesAutoresizingMaskIntoConstraints = false
//            
//            menuLeadingConstraint = menuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth)
//            
//            NSLayoutConstraint.activate([
//                menuLeadingConstraint,
//                menuViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
//                menuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                menuViewController.view.widthAnchor.constraint(equalToConstant: menuWidth)
//            ])
//            
//            menuViewController.didMove(toParent: self)
//        }
//        
//        private func setupGestures() {
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//            view.addGestureRecognizer(panGesture)
//        }
//        
//        // MARK: - Actions
//        @objc private func openMenu() {
//            isMenuOpen = true
//            menuLeadingConstraint.constant = 0
//            
//            UIView.animate(withDuration: animationDuration, animations: {
//                self.view.layoutIfNeeded()
//                self.dimmingView.alpha = 1
//            })
//        }
//        
//        @objc private func closeMenu() {
//            isMenuOpen = false
//            menuLeadingConstraint.constant = -menuWidth
//            
//            UIView.animate(withDuration: animationDuration, animations: {
//                self.view.layoutIfNeeded()
//                self.dimmingView.alpha = 0
//            })
//        }
//        
//        @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
//            let translation = gesture.translation(in: view)
//            let velocity = gesture.velocity(in: view)
//            
//            switch gesture.state {
//            case .changed:
//                var newConstant = menuLeadingConstraint.constant + translation.x
//                newConstant = min(0, max(-menuWidth, newConstant))
//                menuLeadingConstraint.constant = newConstant
//                
//                // Обновляем прозрачность затемнения в зависимости от положения меню
//                let progress = (menuWidth + newConstant) / menuWidth
//                dimmingView.alpha = progress * 0.5
//                
//                gesture.setTranslation(.zero, in: view)
//                
//            case .ended:
//                let shouldOpen = velocity.x > 500 || (velocity.x > -500 && menuLeadingConstraint.constant > -menuWidth / 2)
//                
//                if shouldOpen {
//                    openMenu()
//                } else {
//                    closeMenu()
//                }
//                
//            default:
//                break
//            }
//        }
//        
//        // MARK: - Public Methods
//        func toggleMenu() {
//            isMenuOpen ? closeMenu() : openMenu()
//        }
//}
