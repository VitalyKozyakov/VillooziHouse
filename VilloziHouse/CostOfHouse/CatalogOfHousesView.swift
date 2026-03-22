//
//  CatalogOfHousesView.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

class CatalogOfHousesView: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, HouseCellDelegate {
    func didToggleFavorite(in cell: CatalogOfHousesCell, state: Bool) {
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allSections.count + 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Все проекты"
        }
        return allSections[row - 1].named
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            pickerTextField.text = "🔍 Все проекты"
        } else {
            pickerTextField.text = "🔍 \(allSections[row - 1].named)"
        }
        filterSections(selectedIndex: row)
    }
    
    
    private let dataSourse = CatalogOfHousesDataSourse()
    private var allSections: [CatalogOfHousesDataSourse.HouseProject] = []
    private var filteredSections: [CatalogOfHousesDataSourse.HouseProject] = []
    
    private var tableView = UITableView()
    private let pickerView = UIPickerView()
    
    private let pickerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "🔍 Поиск проектов"
        textField.borderStyle = .roundedRect
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
        loadData()
    }
    private func setupViewController() {
        title = "Каталог домов"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        
        pickerView.dataSource = self
        pickerView.delegate = self
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(CatalogOfHousesCell.self, forCellReuseIdentifier: CatalogOfHousesCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(pickerTextField)
        pickerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15.0, *) {
                tableView.sectionHeaderTopPadding = 0
            
            tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 10, right: 40)
            }
        
        NSLayoutConstraint.activate([
            pickerTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pickerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            pickerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            pickerTextField.heightAnchor.constraint(equalToConstant: 48),
            
            tableView.topAnchor.constraint(equalTo: pickerTextField.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        pickerTextField.inputView = pickerView
        pickerTextField.inputAccessoryView = makeToolbar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    private func makeToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(handleDone))
        toolbar.items = [flexible, done]
        return toolbar
    }
    @objc private func handleDone() {
        pickerTextField.resignFirstResponder()
    }
    @objc private func dismissPicker() {
        pickerTextField.resignFirstResponder()
    }
    
    private func loadData() {
        allSections = dataSourse.getHouse()
        filteredSections = allSections
        tableView.reloadData()
        
        pickerTextField.text = "🔍 Все проекты"
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    private func filterSections(selectedIndex: Int) {
        if selectedIndex == 0 {
            filteredSections = allSections
        } else {
            let selectedSection = allSections[selectedIndex - 1]
            filteredSections = [selectedSection]
        }
        tableView.reloadData()
        if tableView.numberOfSections > 0 {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    // MARK: - UITableViewDataSource
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sectionsCount = filteredSections.count
        return sectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < filteredSections.count else { return 0
        }
                
                let rowsCount = filteredSections[section].house.count
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatalogOfHousesCell.reuseIdentifier, for: indexPath) as? CatalogOfHousesCell else {
            return UITableViewCell()
        }
        
        let house = filteredSections[indexPath.section].house[indexPath.row]
        
        cell.backgroundColor = .clear
        
        cell.configure(with: house)
        cell.delegate = self
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor(red: 0.74, green: 0.9, blue: 0.78, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filteredSections[section].named
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.text = filteredSections[section].named
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    // MARK: - UITableViewDelegate
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //            let footerView = UIView()
    //            footerView.backgroundColor = .clear
    //            return footerView
    //        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.section < filteredSections.count,
                 indexPath.row < filteredSections[indexPath.section].house.count else {
            return
    }
        let house = filteredSections[indexPath.section].house[indexPath.row]
    
        let calculatingVC = CalculatingTheHouseViewController()
        
                navigationController?.pushViewController(calculatingVC, animated: true)
        }
    // MARK: - HouseCellDelegate
    
}

#Preview(traits: .portrait) {
    let homeVC = CatalogOfHousesView()
    let navigationController = UINavigationController(rootViewController: homeVC)
    return navigationController
}
