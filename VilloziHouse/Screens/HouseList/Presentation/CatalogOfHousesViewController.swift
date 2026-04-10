//
//  CatalogOfHousesView.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit



class CatalogOfHousesViewController: UIViewController, HouseCellDelegate {
    // MARK: - Private properties
    
    //    private let dataSourse = CatalogOfHousesDataSourse()
    private var allSections: [HouseProject] = []
    private var filteredSections: [HouseProject] = []
    private let dataSource: CatalogOfHousesDataSourse
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView =  UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CatalogOfHousesCell.self, forCellReuseIdentifier: CatalogOfHousesCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemBackground
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "🔍 Выбор проектов"
        textField.borderStyle = .roundedRect
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .systemGray6
        textField.inputView = pickerView
        textField.inputAccessoryView = makeToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
        loadFavoriteStatus()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    init(dataSource: CatalogOfHousesDataSourse) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup view
    
    private func setupViewController() {
        title = "Каталог домов"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        addTapGestureToHidePicker()
        
        view.addSubview(tableView)
        view.addSubview(pickerTextField)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
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
    }
    
    // MARK: - Private methods
    
    private func addTapGestureToHidePicker() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func filterSections(selectedIndex: Int) {
        if selectedIndex == 0 {
            filteredSections = allSections
        } else {
            let selectedSection = allSections[selectedIndex - 1]
            filteredSections = [selectedSection]
        }
        
        tableView.reloadData()
        if tableView.numberOfSections > 0,
           tableView.numberOfRows(inSection: 0) > 0 {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    private func loadFavoriteStatus() {
        let favorites = UserDefaults.standard.array(forKey: "favoriteHouses") as? [String] ?? []
        
        allSections = dataSource.getHouse()
        
        for sectionIndex in 0..<allSections.count { // проходимся по секциям
            for houseIndex in 0..<allSections[sectionIndex].house.count { // проходим по каждому оюъекту в секции
                var house = allSections[sectionIndex].house[houseIndex] // берем каждый объект
                house.isFavorite = favorites.contains(house.id) // обновляем свойство isFavorite, если айди дома в избранном на true, если не в избранном то фолс
                allSections[sectionIndex].house[houseIndex] = house // перезаписываем объект с новым значением
            }
        }
        
        dataSource.saveHouses(allSections)
        
        filteredSections = allSections
        tableView.reloadData()
        
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    private func updateData() {
        allSections = dataSource.getHouse()
        
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        
        if selectedRow == 0 {
            filteredSections = allSections
        } else if selectedRow - 1 < allSections.count {
            filteredSections = [allSections[selectedRow - 1]]
        } else {
            filteredSections = allSections
        }
        
        tableView.reloadData()
    }
    
    func didToggleFavorite(in cell: CatalogOfHousesCell, state: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        filteredSections[indexPath.section].house[indexPath.row].isFavorite = state
        let houseId = filteredSections[indexPath.section].house[indexPath.row].id
        
        for sectionIndex in 0..<allSections.count {
            for rowIndex in 0..<allSections[sectionIndex].house.count {
                if allSections[sectionIndex].house[rowIndex].id == houseId {
                    allSections[sectionIndex].house[rowIndex].isFavorite = state
                }
            }
        }
        
        dataSource.saveHouses(allSections)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        let house = filteredSections[indexPath.section].house[indexPath.row]
        saveFavoriteStatus(for: house.id, isFavorite: state)
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
    
    
    //  MARK: - Keyboard
    
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
    
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension CatalogOfHousesViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        cell.configure(with: house)
        //ШАГ1
        if house.imageGallery.isEmpty,
           let image = house.imageProject {
            if let uiImage = UIImage(named: image) {
                cell.configure(images: [uiImage])
            } else {
                cell.configure(images: [UIImage(systemName: "house.fill") ?? UIImage()])
            }
            
        } else {
            let uiImages = house.imageGallery.compactMap { UIImage(named: $0) }
            cell.configure(images: uiImages)
        }
        
        cell.delegate = self
        return cell
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
        
        
        let houseImages: [UIImage]
        if house.imageGallery.isEmpty,
           let image = house.imageProject {
            if let uiImage = UIImage(named: image) {
                houseImages = [uiImage]
            } else {
                houseImages = [UIImage(systemName: "house.fill") ?? UIImage()]
            }
        } else {
            let uiImages = house.imageGallery.compactMap { UIImage(named: $0) }
            houseImages = uiImages
        }
        
        let calculatingVC = CalculatingTheHouseViewController(
            houseId: house.id,
            houseImage: UIImage(named: house.imageProject ?? ""),
            houseImages: houseImages
        )
        
        //        navigationController?.present(calculatingVC, animated: true)
        navigationController?.pushViewController(calculatingVC, animated: true)
    }
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension CatalogOfHousesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
}
#Preview(traits: .portrait) {
    let dataSource = CatalogOfHousesDataSourse()
    let homeVC = CatalogOfHousesViewController(dataSource: dataSource)
    let navigationController = UINavigationController(rootViewController: homeVC)
    return navigationController
}
