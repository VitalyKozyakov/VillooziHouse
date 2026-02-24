////
////  CalculatingTheHouse.swift
////  VilloziHouse
////
////  Created by Виталий Козьяков on 23.02.2026.
////
//
//import UIKit
//
//class CalculatingTheHouse: UITableViewController {
//    
//    struct Section {
//        let title: [String] = [
//            "Комплект дома",
//            "Монтаж",
//            "Кровля",
//            "На кровлю",
//            "Фасад",
//            "Торцы крыши",
//            "Свесы крыши, потолки над террасами и балконами",
//            "Окна и двери"
//        ]
//    }
//    private let tableView: UITableView {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = ConstantsColor.colorBackground
//        tableView.separatorStyle = .singleLine
//        tableView.showsVerticalScrollIndicator = true
//        tableView.register(CalculatingTheHouseCell.self, forCellReuseIdentifier: CalculatingTheHouseCell.identifier)
//        return tableView
//    }()
//    
//    private let segmentControl: UISegmentedControl = {
//        let items: [String] = ["Отделка", "Инженерия"]
//        let segmentControl = UISegmentedControl(items: items)
//        segmentControl.selectedSegmentIndex = 0
//        return segmentControl
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTableView()
//    }
//    
//    
//    private func setupTableView() {
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 50
//    }
//    
//    
//}
//extension CalculatingTheHouse: UITableViewDataSource, UITableViewDelegate {
//        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            Section().title.count
//        }
//        
//    }
