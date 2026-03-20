//
//  CalculatingTheHouse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

final class CalculatingTheHouseViewController: UIViewController {
    // MARK: - Models
    
    enum DataType {
        case finishing
        case engineering
    }
    
    struct Category {
        enum Selection {
            case single // одна
            case multiple //несколько
        }
        
        let title: String // название секции
        let selectionType: Selection  // "single" или "multiple"
        let options: [FinishingOption] // ячейки с названиями и ценами(два лейбла)
    }
    
    struct FinishingOption {
        let id: String // индивид. номер(порядковый)
        let title: String // название в ячейке
        let deltaRub: Double //стоимость в ячейке
        let isDefaultSelected: Bool
    }
    
    struct StructureHome {
        static let titles: [String] = [
            "Набор раскроенных панелей",
            "Пиломатериал сухой строганый",
            "Клееный брус",
            "Крепеж (41 мм, 75 мм, 120 мм.)",
            "Специализированный силовой крепеж (180мм - 360мм)",
            "Материалы, улучшающие теплоизоляцию и герметичность дома:"
        ]
    }
    
    // MARK: - Data
    
    let finishingData: [Category] = [
        Category(
            title: "Комплект дома",
            selectionType: .multiple,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Набор раскроенных панелей",
                    deltaRub: 551265.56, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "2",
                    title: "Пиломатериал сухой строганый",
                    deltaRub: 598240.00, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "3",
                    title: "Клееный брус",
                    deltaRub: 149064.00,
                    isDefaultSelected: true
                ),
                FinishingOption(
                    id: "4",
                    title: "Крепеж (41 мм, 75 мм, 120 мм.)",
                    deltaRub: 59280.56, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "5",
                    title: "Специализированный силовой крепеж (180мм - 360мм)",
                    deltaRub: 15150.44, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "6",
                    title: "Материалы, улучшающие теплоизоляцию и герметичность дома:",
                    deltaRub: 42748, isDefaultSelected: false
                ),
                FinishingOption(
                    id: "7",
                    title: "Профессиональный монтаж:",
                    deltaRub: 525372, isDefaultSelected: false
                ),
                FinishingOption(
                    id: "8",
                    title: "Монтаж фундамента-железобетонные сваи:",
                    deltaRub: 320767, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "9",
                    title: "Бытовка, снегозадержетели, доставка, биотуалет, укрывные тенты, подкладные доски, временная лестница:",
                    deltaRub: 90000.00, isDefaultSelected: false
                ),
            ]
        ),Category(
            title: "Кровля",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Металлочерепица",
                    deltaRub: 378793, isDefaultSelected: true
                ),FinishingOption(
                    id: "2",
                    title: "Фальцевая кровля",
                    deltaRub: 565608, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Наплавляемая кровля",
                    deltaRub: 590537, isDefaultSelected: false
                ),FinishingOption(
                    id: "4",
                    title: "Битумная черепица",
                    deltaRub: 469722, isDefaultSelected: true
                ),FinishingOption(
                    id: "5",
                    title: "Профнастил кровельный",
                    deltaRub: 414337, isDefaultSelected: false
                ),
            ]
        ),Category(
            title: "На кровлю",
            selectionType: .multiple,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Вентиляционные элементы Vilpe. Количество по проекту",
                    deltaRub: 79947, isDefaultSelected: true
                ),FinishingOption(
                    id: "2",
                    title: "Водосточная система",
                    deltaRub: 105260, isDefaultSelected: true
                )
            ]
        ),Category(
            title: "Фасад",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловый сайдинг",
                    deltaRub: 440905, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Деревянная отделка. Имитация бруса",
                    deltaRub: 665298, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Фасад под кирпич Хауберк",
                    deltaRub: 755887, isDefaultSelected: false
                ),FinishingOption(
                    id: "4",
                    title: "Профнастил стеновой",
                    deltaRub: 752975, isDefaultSelected: false
                ),FinishingOption(
                    id: "5",
                    title: "Клинкерная плитка",
                    deltaRub: 1515379, isDefaultSelected: false
                ),FinishingOption(
                    id: "6",
                    title: "Виниловые фасадные панели",
                    deltaRub: 498662, isDefaultSelected: false
                ),FinishingOption(
                    id: "7",
                    title: "Фиброцементный сайдинг",
                    deltaRub: 1116033, isDefaultSelected: false
                ),FinishingOption(
                    id: "8",
                    title: "Фальц",
                    deltaRub: 752975, isDefaultSelected: true
                ),FinishingOption(
                    id: "9",
                    title: "Металлический сайдинг",
                    deltaRub: 678633, isDefaultSelected: true
                ),FinishingOption(
                    id: "10",
                    title: "Клинкерные термопанели",
                    deltaRub: 450112, isDefaultSelected: true
                ),FinishingOption(
                    id: "11",
                    title: "Консервация фасада",
                    deltaRub: 68922, isDefaultSelected: true
                ),
            ]
        ),Category(
            title: "Торцы крыши",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловая J-фаска",
                    deltaRub: 42732, isDefaultSelected: true
                ),FinishingOption(
                    id: "2",
                    title: "Металлическая L-планка",
                    deltaRub: 69792, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Дерево",
                    deltaRub: 76765, isDefaultSelected: false
                )
            ]
        ),Category(
            title: "Свесы крыши, потолки над террасами и балконами",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловые софиты",
                    deltaRub: 64680, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Фиброцементный сайдинг",
                    deltaRub: 167624, isDefaultSelected: true
                ),FinishingOption(
                    id: "3",
                    title: "Дерево",
                    deltaRub: 103817, isDefaultSelected: false
                ),FinishingOption(
                    id: "4",
                    title: "Металлические софиты",
                    deltaRub: 107667, isDefaultSelected: true
                )
            ]
        ),Category(
            title: "Окна и двери",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Металлопластиковые окна и двери",
                    deltaRub: 388154, isDefaultSelected: false
                )
            ]
        ),Category(
            title: "Балконы, террасы, лестницы",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Деревянные горизонтальные типовые",
                    deltaRub: 200928, isDefaultSelected: false
                )
            ]
        ),Category(
            title: "Отделка балок и стоек на террасе и балконе",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Шпатлевка и окрашивание",
                    deltaRub: 53374, isDefaultSelected: false
                )
            ]
        ),Category(
            title: "Настил на террасах",
            selectionType: .single,
            options: [FinishingOption(id: "1", title: "Террасная доска", deltaRub: 262559, isDefaultSelected: false),FinishingOption(
                id: "1",
                title: "Листовые материалы",
                deltaRub: 182550, isDefaultSelected: false
            ),FinishingOption(
                id: "1",
                title: "Террасная доска искусственная (ДПК)",
                deltaRub: 349796, isDefaultSelected: true
            ),
            ]
        )
    ]
    
    let engineeringData: [Category] = [
        Category(
            title: "Отопление",
            selectionType: .single,
            options: [
                FinishingOption(id: "h1", title: "Электрический котел", deltaRub: 85000, isDefaultSelected: true),
                FinishingOption(id: "h2", title: "Газовый котел", deltaRub: 120000, isDefaultSelected: true),
                FinishingOption(id: "h3", title: "Твердотопливный котел", deltaRub: 95000, isDefaultSelected: true),
                FinishingOption(id: "h4", title: "Тепловой насос", deltaRub: 350000, isDefaultSelected: true),
                FinishingOption(id: "h5", title: "Радиаторы отопления", deltaRub: 89000, isDefaultSelected: true),
                FinishingOption(id: "h6", title: "Теплый пол водяной", deltaRub: 145000, isDefaultSelected: true)
            ]
        ),
        Category(
            title: "Водоснабжение",
            selectionType: .multiple,
            options: [
                FinishingOption(id: "w1", title: "Скважина", deltaRub: 120000, isDefaultSelected: false),
                FinishingOption(id: "w2", title: "Насосная станция", deltaRub: 45000, isDefaultSelected: false),
                FinishingOption(id: "w3", title: "Фильтрация воды", deltaRub: 35000, isDefaultSelected: false),
                FinishingOption(id: "w4", title: "Водонагреватель", deltaRub: 55000, isDefaultSelected: false),
                FinishingOption(id: "w5", title: "Трубы ХВС", deltaRub: 67000, isDefaultSelected: false),
                FinishingOption(id: "w6", title: "Трубы ГВС", deltaRub: 67000, isDefaultSelected: false),
                FinishingOption(id: "w7", title: "Коллектор водоснабжения", deltaRub: 28000, isDefaultSelected: true)
            ]
        ),
        Category(
            title: "Канализация",
            selectionType: .multiple,
            options: [
                FinishingOption(id: "s1", title: "Септик", deltaRub: 95000, isDefaultSelected: false),
                FinishingOption(id: "s2", title: "Трубы канализации", deltaRub: 45000, isDefaultSelected: false),
                FinishingOption(id: "s3", title: "Ливневая канализация", deltaRub: 67000, isDefaultSelected: false),
                FinishingOption(id: "s4", title: "Дренажная система", deltaRub: 89000, isDefaultSelected: false)
            ]
        ),
        Category(
            title: "Электрика",
            selectionType: .multiple,
            options: [
                FinishingOption(id: "e1", title: "Вводной щиток", deltaRub: 35000, isDefaultSelected: true),
                FinishingOption(id: "e2", title: "Кабель силовой", deltaRub: 89000, isDefaultSelected: true),
                FinishingOption(id: "e3", title: "Розетки и выключатели", deltaRub: 45000, isDefaultSelected: true),
                FinishingOption(id: "e4", title: "Освещение", deltaRub: 67000, isDefaultSelected: true),
                FinishingOption(id: "e5", title: "Заземление и молниезащита", deltaRub: 55000, isDefaultSelected: true),
                FinishingOption(id: "e6", title: "Автоматы и УЗО", deltaRub: 28000, isDefaultSelected: true)
            ]
        ),
        Category(
            title: "Вентиляция",
            selectionType: .single,
            options: [
                FinishingOption(id: "v1", title: "Естественная вентиляция", deltaRub: 35000, isDefaultSelected: true),
                FinishingOption(id: "v2", title: "Приточная вентиляция", deltaRub: 89000, isDefaultSelected: true),
                FinishingOption(id: "v3", title: "Приточно-вытяжная с рекуперацией", deltaRub: 245000, isDefaultSelected: true),
                FinishingOption(id: "v4", title: "Воздуховоды", deltaRub: 67000, isDefaultSelected: true)
            ]
        ),
        Category(
            title: "Кондиционирование",
            selectionType: .multiple,
            options: [
                FinishingOption(id: "c1", title: "Сплит-система", deltaRub: 75000, isDefaultSelected: false),
                FinishingOption(id: "c2", title: "Мульти-сплит система", deltaRub: 185000, isDefaultSelected: false),
                FinishingOption(id: "c3", title: "Фреонопроводы", deltaRub: 35000, isDefaultSelected: false)
            ]
        ),
        Category(
            title: "Слаботочные системы",
            selectionType: .multiple,
            options: [
                FinishingOption(id: "l1", title: "Интернет и телефония", deltaRub: 25000, isDefaultSelected: false),
                FinishingOption(id: "l2", title: "Телевидение", deltaRub: 15000, isDefaultSelected: false),
                FinishingOption(id: "l3", title: "Домофон", deltaRub: 18000, isDefaultSelected: false),
                FinishingOption(id: "l4", title: "Видеонаблюдение", deltaRub: 65000, isDefaultSelected: false),
                FinishingOption(id: "l5", title: "Охранная сигнализация", deltaRub: 55000, isDefaultSelected: false)
            ]
        )
    ]
    
    // MARK: - Private properties
    
    var currentData: [Category] = []
    
    var selectedFinishingOptions: Set<String> = []
    var selectedEngineeringOptions: Set<String> = []
    
    
    var sectionItems: [[(name: String, price: String)]] = []
    
    private var finishingSelectedSingleRow: [Int?] = [] // для секций .single
    private var finishingSelectedMultipleRows: [Set<Int>] = [] // для секций .multiple

    private var engineeringSelectedSingleRow: [Int?] = []
    private var engineeringSelectedMultipleRows: [Set<Int>] = []
    
    private let priceSumm: [Int] = []
    private var calculatedPrice: String = ""
    
    // MARK: - UI
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let homeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "home2014"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let segmentControl: UISegmentedControl = {
        let items: [String] = ["Отделка", "Инженерия"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    private let finalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Итого: 0 ₽"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оставить заявку", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentData = finishingData
        
        finishingSelectedSingleRow = Array(repeating: nil, count: finishingData.count)
        finishingSelectedMultipleRows = Array(repeating: [], count: finishingData.count)
        
        engineeringSelectedSingleRow = Array(repeating: nil, count: engineeringData.count)
        engineeringSelectedMultipleRows = Array(repeating: [], count: engineeringData.count)
        
        applyDefaultSelection()
            
        setupTableView()
        setupUI()
        updateTotalPriceLabel()
    }
    
    // MARK: - Configure UI
    
    private func setupUI() {
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        calculatedPrice = "Выбирите комплектацию для рассчета"
        finalPriceLabel.text = "Итоговая цена: \(calculatedPrice)"
        
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)

        view.addSubview(homeImageView)
        view.addSubview(segmentControl)
        view.addSubview(tableView)
        view.addSubview(finalPriceLabel)
        view.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
            homeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            homeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            homeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            homeImageView.heightAnchor.constraint(equalToConstant: 200),
            
            segmentControl.topAnchor.constraint(equalTo: homeImageView.bottomAnchor, constant: 12),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 32),
            
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: finalPriceLabel.topAnchor, constant: -16),
            
            finalPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            finalPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            finalPriceLabel.heightAnchor.constraint(equalToConstant: 36),
            
            applyButton.topAnchor.constraint(equalTo: finalPriceLabel.bottomAnchor, constant: 8),
            applyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        //        tableView.contentInset = UIEdgeInsets(top: 52, left: 0, bottom: 0, right: 0)
    }
    
    private func setupTableView() {
        tableView.register(
            CalculatingTheHouseCell.self,
            forCellReuseIdentifier: CalculatingTheHouseCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        //        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = true
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.backgroundColor = ConstantsColor.colorBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Private methods
    
    private func applyDefaultSelection() {
        for (sectionIndex, section) in finishingData.enumerated() {
            switch section.selectionType {
            case .single:
                if let rowIndex = section.options.firstIndex(where: {
                    $0.isDefaultSelected
                }) {
                    finishingSelectedSingleRow[sectionIndex] = rowIndex
                }
            case .multiple:
                let selectedRows = Set(
                    section.options.enumerated()
                        .filter { $0.element.isDefaultSelected }
                        .map { $0.offset }
                )
                
                finishingSelectedMultipleRows[sectionIndex] = selectedRows
            }
        }
        
        for (sectionIndex, section) in engineeringData.enumerated() {
                    switch section.selectionType {
                    case .single:
                        if let rowIndex = section.options.firstIndex(where: {
                            $0.isDefaultSelected
                        }) {
                            engineeringSelectedSingleRow[sectionIndex] = rowIndex
                        }
                    case .multiple:
                        let selectedRows = Set(
                            section.options.enumerated()
                                .filter { $0.element.isDefaultSelected }
                                .map { $0.offset }
                        )
                        
                        engineeringSelectedMultipleRows[sectionIndex] = selectedRows
                    }
                }
    }
    
    private func calculateSum(
        for data: [Category],
        selectedSingleRow: [Int?],
        selectedMultipleRows: [Set<Int>]
    ) -> Double {
        var total: Double = 0
        
        for (sectionIndex, section) in data.enumerated() {
            switch section.selectionType {
            case .single:
                if let selectedRow = selectedSingleRow[sectionIndex] {
                    total += section.options[selectedRow].deltaRub
                }
            case .multiple:
                for rowIndex in selectedMultipleRows[sectionIndex] {
                    total += section.options[rowIndex].deltaRub
                }
            }
        }
        
        return total
    }
    
    private func calculateTotalSumma() -> Double {
        let finishingTotal = calculateSum(
            for: finishingData,
            selectedSingleRow: finishingSelectedSingleRow,
            selectedMultipleRows: finishingSelectedMultipleRows
        )
        
        let engineeringTotal = calculateSum(
            for: engineeringData,
            selectedSingleRow: engineeringSelectedSingleRow,
            selectedMultipleRows: engineeringSelectedMultipleRows
        )
        
        return finishingTotal + engineeringTotal
    }
    
    private func updateTotalPriceLabel() {
        let total = calculateTotalSumma()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        if let formattedString = formatter.string(from: NSNumber(value: total)) {
            finalPriceLabel.text = "Итого: \(formattedString) ₽"
        } else {
            finalPriceLabel.text = "Итого: \(total) ₽"
        }
    }
    
    private func goToApplicationVC() {
        let applicationVC = ApplicationVC(houseName: "", totalPrice: 0)
        applicationVC.receivedPrice = finalPriceLabel.text ?? ""
        navigationController?.pushViewController(applicationVC, animated: true)
    }
    
    // MARK: - Actions
    
    @objc private func applyButtonTapped() {
        let applicationVC = ApplicationVC(houseName: "Мой дом", totalPrice: 0)
        navigationController?.pushViewController(applicationVC, animated: true)
    }
    
    @objc func segmentChanged() {
        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            if self.segmentControl.selectedSegmentIndex == 0 {
                self.currentData = self.finishingData
            } else {
                self.currentData = self.engineeringData
            }
            self.tableView.reloadData()
        }, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CalculatingTheHouseViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentData[section].options.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentData[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CalculatingTheHouseCell.identifier,
            for: indexPath
        ) as? CalculatingTheHouseCell else {
            return UITableViewCell()
        }
        
        let option = currentData[indexPath.section].options[indexPath.row]
        let selectionType = currentData[indexPath.section].selectionType
        
        let isSelected: Bool
        
        if segmentControl.selectedSegmentIndex == 0 {
            switch selectionType {
            case .single:
                isSelected = (finishingSelectedSingleRow[indexPath.section] == indexPath.row)
            case .multiple:
                isSelected = finishingSelectedMultipleRows[indexPath.section].contains(indexPath.row)
            }
        } else {
            switch selectionType {
            case .single:
                isSelected = (engineeringSelectedSingleRow[indexPath.section] == indexPath.row)
            case .multiple:
                isSelected = engineeringSelectedMultipleRows[indexPath.section].contains(indexPath.row)
            }
        }

        cell.configure(with: option, selectionType: selectionType, isSelected: isSelected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectionType = currentData[indexPath.section].selectionType
        let isFinishing = segmentControl.selectedSegmentIndex == 0
        
        switch selectionType {
        case .single:
            if isFinishing {
                let prev = finishingSelectedSingleRow[indexPath.section]
                finishingSelectedSingleRow[indexPath.section] = indexPath.row
                
                var toReload = [indexPath]
                if let prev, prev != indexPath.row {
                    toReload.append(IndexPath(row: prev, section: indexPath.section))
                }
                tableView.reloadRows(at: toReload, with: .none)
            } else {
                let prev = engineeringSelectedSingleRow[indexPath.section]
                engineeringSelectedSingleRow[indexPath.section] = indexPath.row
                
                var toReload = [indexPath]
                if let prev, prev != indexPath.row {
                    toReload.append(IndexPath(row: prev, section: indexPath.section))
                }
                tableView.reloadRows(at: toReload, with: .none)
            }
            
        case .multiple:
            if isFinishing {
                if finishingSelectedMultipleRows[indexPath.section].contains(indexPath.row) {
                    finishingSelectedMultipleRows[indexPath.section].remove(indexPath.row)
                } else {
                    finishingSelectedMultipleRows[indexPath.section].insert(indexPath.row)
                }
                tableView.reloadRows(at: [indexPath], with: .none)
            } else {
                if engineeringSelectedMultipleRows[indexPath.section].contains(indexPath.row) {
                    engineeringSelectedMultipleRows[indexPath.section].remove(indexPath.row)
                } else {
                    engineeringSelectedMultipleRows[indexPath.section].insert(indexPath.row)
                }
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        updateTotalPriceLabel()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    CalculatingTheHouseViewController()
}
