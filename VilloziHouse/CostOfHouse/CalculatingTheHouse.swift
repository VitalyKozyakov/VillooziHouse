//
//  CalculatingTheHouse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

class CalculatingTheHouse: UITableViewController {
    
    
    
    struct SectionData {
       static let titles: [String] = [
            "Комплект дома",
            "Монтаж",
            "Кровля",
            "На кровлю",
            "Фасад",
            "Торцы крыши",
            "Свесы крыши, потолки над террасами и балконами",
            "Окна и двери"
        ]
    }
    //    private let tableView: UITableView = {
    //        let tableView = UITableView()
    //        tableView.translatesAutoresizingMaskIntoConstraints = false
    //        tableView.backgroundColor = ConstantsColor.colorBackground
    //        tableView.separatorStyle = .singleLine
    //        tableView.showsVerticalScrollIndicator = true
    //        tableView.register(CalculatingTheHouseCell.self, forCellReuseIdentifier: CalculatingTheHouseCell.identifier)
    //        return tableView
    //    }()
    var sectionItems: [[(name: String, price: String)]] = []
    
    private let segmentControl: UISegmentedControl = {
        let items: [String] = ["Отделка", "Инженерия"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    private func setupTableView() {
        tableView.register(CalculatingTheHouseCell.self,
                           forCellReuseIdentifier: CalculatingTheHouseCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = ConstantsColor.colorBackground
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = true
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func loadSampleData() {
            sectionItems = SectionData.titles.map { _ in
                return [
                    (name: "Материал 1", price: "1000 ₽"),
                    (name: "Материал 2", price: "2000 ₽"),
                    (name: "Материал 3", price: "3000 ₽"),
                    (name: "Материал 4", price: "4000 ₽"),
                    (name: "Материал 5", price: "5000 ₽")
                ]
            }
        }
    
    
}
extension CalculatingTheHouse {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return SectionData.titles.count
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionData.titles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatingTheHouseCell",
                                                       for: indexPath) as? CalculatingTheHouseCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
#Preview {
    CalculatingTheHouse()
}
