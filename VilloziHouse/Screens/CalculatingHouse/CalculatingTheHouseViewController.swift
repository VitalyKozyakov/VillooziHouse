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
        case characteristics
    }
    
    struct CharacteristicItem {
        let title: String
        let value: String
    }
    
    struct CharacteristicSection {
        let title: String
        let options: [CharacteristicItem]
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
    
    private let houseId: String
    private let configurationService: CatalogExteriorDecorationDataSourse
    private var houseConfiguration: HouseConfiguration?
    private var selectedHouseImage: UIImage?
    private let houseImages: [UIImage]
    private var currentImageIndex: Int = 0
    
    
    
    // MARK: - Data
    
    private var characteristicsSections: [CharacteristicSection] {
        return [
            CharacteristicSection(
                title: "1 этаж",
                options: [
                    CharacteristicItem(title: "Высота стен", value: "2,8м"),
                    CharacteristicItem(title: "Перекрытие этажа", value: "СИП-ОСП 171мм"),
                    CharacteristicItem(title: "Внешние стены", value: "СИП-ОСП 171мм"),
                    CharacteristicItem(title: "Внутренние перегородки", value: "Каркас 145мм")
                ]
            ),
            CharacteristicSection(
                title: "2 этаж",
                options: [
                    CharacteristicItem(title: "Перекрытие этажа", value: "СИП-ОСП 171мм")
                ]
            ),
            CharacteristicSection(
                title: "Мансарда",
                options: [
                    CharacteristicItem(title: "Высота стен", value: "2,5м-2,8м"),
                    CharacteristicItem(title: "Внешние стены", value: "СИП-ОСП 171мм"),
                    CharacteristicItem(title: "Внутренние перегородки", value: "Каркас 145мм")
                ]
            ),
            CharacteristicSection(
                title: "Крыша",
                options: [
                    CharacteristicItem(title: "Крыша", value: "СИП-ОСП 221мм")
                ]
            )
        ]
    }
    
    var finishingData: [Category] {
        return [
            createHouseKitCategory(),
            createRoofingCategory(),
            createRoofAccessoriesCategory(),
            createFacadeCategory(),
            createGableEndCategory(),
            createSoffitCategory(),
            createWindowsDoorsCategory(),
            createTerracesCategory(),
            createBeamFinishingCategory(),
            createTerraceDeckingCategory()
        ]
    }
    
    private func createHouseKitCategory() -> Category {
        let kit = houseConfiguration?.houseKit ?? HouseConfiguration.HouseKit(
            cutPanels: 0,//Обрезные панели
            dryLumber: 0,//пиломатериалы
            gluedBeam: 0,//клееный брус
            fastener: 0,//крепеж
            powerFastener: 0,//силовой крепеж
            insulationMaterials: 0,//изоляционные материалы
            professionalInstallation: 0,//профессиональный монтаж
            foundationSlab: 0,//фундамент
            household: 0 //бытовка
        )
        
        return Category(
            title: "Комплект дома",
            selectionType: .multiple,
            options: [
                FinishingOption(
                    id: "kit_1",
                    title: "Набор раскроенных панелей",
                    deltaRub: kit.cutPanels,
                    isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_2",
                    title: "Пиломатериал сухой строганый",
                    deltaRub: kit.dryLumber,
                    isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_3",
                    title: "Клееный брус",
                    deltaRub: kit.gluedBeam,
                    isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_4",
                    title: "Крепеж (41 мм, 75 мм, 120 мм.)",
                    deltaRub: kit.fastener, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_5",
                    title: "Специализированный силовой крепеж (180мм - 360мм)",
                    deltaRub: kit.powerFastener, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_6",
                    title: "Материалы, улучшающие теплоизоляцию и герметичность дома:",
                    deltaRub: kit.insulationMaterials, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_7",
                    title: "Профессиональный монтаж:",
                    deltaRub: kit.professionalInstallation, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_8",
                    title: "Монтаж фундамента-железобетонные сваи:",
                    deltaRub: kit.foundationSlab, isDefaultSelected: true
                ),
                FinishingOption(
                    id: "kit_9",
                    title: "Бытовка, снегозадержетели, доставка, биотуалет, укрывные тенты, подкладные доски, временная лестница:",
                    deltaRub: kit.foundationSlab, isDefaultSelected: true
                )
            ]
        )
    }
    private func createRoofingCategory() -> Category {
        let roofing = houseConfiguration?.roofingOptions ?? HouseConfiguration.RoofingOptions(
            metalTile: 0,
            bitumenShingle: 0,
            seamRoof: 0,
            corrugatedSheet: 0,
            builtUpRoof: 0
        )
        
        return Category(
            title: "Кровля",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "roof_1",
                    title: "Металлочерепица",
                    deltaRub: roofing.metalTile, isDefaultSelected: false
                ),FinishingOption(
                    id: "roof_2",
                    title: "Фальцевая кровля",
                    deltaRub: roofing.bitumenShingle, isDefaultSelected: false
                ),FinishingOption(
                    id: "roof_3",
                    title: "Наплавляемая кровля",
                    deltaRub: roofing.seamRoof, isDefaultSelected: false
                ),FinishingOption(
                    id: "roof_4",
                    title: "Битумная черепица",
                    deltaRub: roofing.corrugatedSheet, isDefaultSelected: false
                ),FinishingOption(
                    id: "roof_5",
                    title: "Профнастил кровельный",
                    deltaRub: roofing.builtUpRoof, isDefaultSelected: false
                )
            ]
        )
    }
    private func createRoofAccessoriesCategory() -> Category {
        let accessories = houseConfiguration?.roofAccessories ?? HouseConfiguration.RoofAccessories(
            ventilationElements: 0,
            gutterSystem: 0
        )
        
        return Category(
            title: "На кровлю",
            selectionType: .multiple,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Вентиляционные элементы Vilpe. Количество по проекту",
                    deltaRub: accessories.ventilationElements, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Водосточная система",
                    deltaRub: accessories.gutterSystem, isDefaultSelected: false
                )
            ]
        )
    }
    private func createFacadeCategory() -> Category {
        let facade = houseConfiguration?.facadeOptions ?? HouseConfiguration.FacadeOptions(
            vinylSiding: 0,
            vinylPanels: 0,
            woodImitation: 0,
            fiberCementSiding: 0,
            hauberkBrick: 0,
            fold: 0,
            wallCorrugatedSheet: 0,
            metalSiding: 0,
            clinkerTile: 0,
            facadeConservation: 0
        )
        
        return Category(
            title: "Фасад",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловый сайдинг",
                    deltaRub: facade.vinylSiding, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Деревянная отделка. Имитация бруса",
                    deltaRub: facade.woodImitation, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Фасад под кирпич Хауберк",
                    deltaRub: facade.hauberkBrick, isDefaultSelected: false
                ),FinishingOption(
                    id: "4",
                    title: "Профнастил стеновой",
                    deltaRub: facade.wallCorrugatedSheet, isDefaultSelected: false
                ),FinishingOption(
                    id: "5",
                    title: "Клинкерная плитка",
                    deltaRub: facade.clinkerTile, isDefaultSelected: false
                ),FinishingOption(
                    id: "6",
                    title: "Виниловые фасадные панели",
                    deltaRub: facade.vinylPanels, isDefaultSelected: false
                ),FinishingOption(
                    id: "7",
                    title: "Фиброцементный сайдинг",
                    deltaRub: facade.fiberCementSiding, isDefaultSelected: false
                ),FinishingOption(
                    id: "8",
                    title: "Фальц",
                    deltaRub: facade.fold, isDefaultSelected: false
                ),FinishingOption(
                    id: "9",
                    title: "Металлический сайдинг",
                    deltaRub: facade.metalSiding, isDefaultSelected: false
                ),FinishingOption(
                    id: "10",
                    title: "Клинкерная плитка",
                    deltaRub: facade.clinkerTile, isDefaultSelected: false
                ),FinishingOption(
                    id: "11",
                    title: "Консервация фасада",
                    deltaRub: facade.facadeConservation, isDefaultSelected: false
                )
            ]
        )
    }
    private func createGableEndCategory() -> Category {
        let gable = houseConfiguration?.gableEndOptions ?? HouseConfiguration.GableEndOptions(
            vinylJTrim: 0,
            wood: 0,
            metalLTrim: 0
        )
        
        return Category(
            title: "Торцы крыши",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловая J-фаска",
                    deltaRub: gable.vinylJTrim, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Металлическая L-планка",
                    deltaRub: gable.metalLTrim, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Дерево",
                    deltaRub: gable.wood, isDefaultSelected: false
                )
            ]
        )
    }
    private func createSoffitCategory() -> Category {
        let soffit = houseConfiguration?.soffitOptions ?? HouseConfiguration.SoffitOptions(
            vinylSoffit: 0,
            wood: 0,
            fiberCementSiding: 0,
            metalSoffit: 0
        )
        
        return Category(
            title: "Свесы крыши, потолки над террасами и балконами",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Виниловые софиты",
                    deltaRub: soffit.vinylSoffit, isDefaultSelected: false
                ),FinishingOption(
                    id: "2",
                    title: "Фиброцементный сайдинг",
                    deltaRub: soffit.fiberCementSiding, isDefaultSelected: false
                ),FinishingOption(
                    id: "3",
                    title: "Дерево",
                    deltaRub: soffit.wood, isDefaultSelected: false
                ),FinishingOption(
                    id: "4",
                    title: "Металлические софиты",
                    deltaRub: soffit.metalSoffit, isDefaultSelected: false
                )
            ]
        )
    }
    private func createWindowsDoorsCategory() -> Category {
        let windowsDoors = houseConfiguration?.windowsDoors ?? HouseConfiguration.WindowsDoors(
            aluminumDoors: 0,
            metalPlasticWindows: 0
        )
        
        return Category(
            title: "Окна и двери",
            selectionType: .multiple,
            options: [
                FinishingOption(
                    id: "windows_1",
                    title: "Алюминиевые двери",
                    deltaRub: windowsDoors.aluminumDoors,
                    isDefaultSelected: false
                ),
                FinishingOption(
                    id: "windows_2",
                    title: "Металлопластиковые окна и двери",
                    deltaRub: windowsDoors.metalPlasticWindows,
                    isDefaultSelected: false
                )
            ]
        )
    }
    private func createTerracesCategory() -> Category {
        let terraces = houseConfiguration?.terraces ?? HouseConfiguration.Terraces(
            terraceWaterproofing: 0,
            beamFinishing: HouseConfiguration.Terraces.BeamFinishing(puttyAndPaint: 0)
        )
        
        return Category(
            title: "Балконы, террасы, лестницы",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Деревянные горизонтальные типовые",
                    deltaRub: terraces.terraceWaterproofing, isDefaultSelected: false
                )
            ]
        )
    }
    private func createBeamFinishingCategory() -> Category {
        let beamFinishing = houseConfiguration?.terraces.beamFinishing ?? HouseConfiguration.Terraces.BeamFinishing(puttyAndPaint: 0)
        
        return Category(
            title: "Отделка балок и стоек на террасе и балконе",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "1",
                    title: "Шпатлевка и окрашивание",
                    deltaRub: beamFinishing.puttyAndPaint, isDefaultSelected: false
                )
            ]
        )
    }
    private func createTerraceDeckingCategory() -> Category {
        let decking = houseConfiguration?.terraceDeckingOptions ?? HouseConfiguration.TerraceDeckingOptions(
            woodenDecking: 0,
            compositeDecking: 0,
            sheetMaterials: 0
        )
        
        return Category(
            title: "Настил на террасах",
            selectionType: .single,
            options: [FinishingOption(id: "1", title: "Террасная доска", deltaRub: decking.woodenDecking, isDefaultSelected: false),FinishingOption(
                id: "1",
                title: "Листовые материалы",
                deltaRub: decking.sheetMaterials, isDefaultSelected: false
            ),FinishingOption(
                id: "1",
                title: "Террасная доска искусственная (ДПК)",
                deltaRub: decking.compositeDecking, isDefaultSelected: false
            )
            ]
        )
    }
    
    let engineeringData: [Category] = [
        Category(
            title: "Отопление",
            selectionType: .single,
            options: [
                FinishingOption(
                    id: "h1",
                    title: "Электрический котел",
                    deltaRub: 85000,
                    isDefaultSelected: false
                ),
                FinishingOption(id: "h2", title: "Газовый котел", deltaRub: 120000, isDefaultSelected: false),
                FinishingOption(id: "h3", title: "Твердотопливный котел", deltaRub: 95000, isDefaultSelected: false),
                FinishingOption(id: "h4", title: "Тепловой насос", deltaRub: 350000, isDefaultSelected: false),
                FinishingOption(id: "h5", title: "Радиаторы отопления", deltaRub: 89000, isDefaultSelected: false),
                FinishingOption(id: "h6", title: "Теплый пол водяной", deltaRub: 145000, isDefaultSelected: false)
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
                FinishingOption(id: "w7", title: "Коллектор водоснабжения", deltaRub: 28000, isDefaultSelected: false)
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
                FinishingOption(id: "e1", title: "Вводной щиток", deltaRub: 35000, isDefaultSelected: false),
                FinishingOption(id: "e2", title: "Кабель силовой", deltaRub: 89000, isDefaultSelected: false),
                FinishingOption(id: "e3", title: "Розетки и выключатели", deltaRub: 45000, isDefaultSelected: false),
                FinishingOption(id: "e4", title: "Освещение", deltaRub: 67000, isDefaultSelected: false),
                FinishingOption(id: "e5", title: "Заземление и молниезащита", deltaRub: 55000, isDefaultSelected: false),
                FinishingOption(id: "e6", title: "Автоматы и УЗО", deltaRub: 28000, isDefaultSelected: false)
            ]
        ),
        Category(
            title: "Вентиляция",
            selectionType: .single,
            options: [
                FinishingOption(id: "v1", title: "Естественная вентиляция", deltaRub: 35000, isDefaultSelected: false),
                FinishingOption(id: "v2", title: "Приточная вентиляция", deltaRub: 89000, isDefaultSelected: false),
                FinishingOption(id: "v3", title: "Приточно-вытяжная с рекуперацией", deltaRub: 245000, isDefaultSelected: false),
                FinishingOption(id: "v4", title: "Воздуховоды", deltaRub: 67000, isDefaultSelected: false)
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
    
    var currentData: [Category] {
        switch segmentControl.selectedSegmentIndex {
            case 0:
            return finishingData
        case 1:
            return engineeringData
        default:
            return finishingData
        }
    }
    
    private var isCharacteristicsTab: Bool {
        return segmentControl.selectedSegmentIndex == 2
    }
    
    private var filteredSections: [HouseProject] = []
    
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
        let imageView = UIImageView(image: UIImage(named: "project127-14-3"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.tintColor = .systemGray3
        imageView.contentMode = .center
        imageView.backgroundColor = .systemGray6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let segmentControl: UISegmentedControl = {
        let items: [String] = ["Отделка", "Инженерия","Характеристики"]
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
    
    // MARK: - Initialization
    
    init(
        houseId: String,
        houseImage: UIImage? = nil,
        houseImages: [UIImage] = [],
        configurationService: CatalogExteriorDecorationDataSourse = CatalogExteriorDecorationDataSourse()
    ) {
        self.houseId = houseId
        self.selectedHouseImage = houseImage
        self.houseImages = houseImages
        self.configurationService = configurationService
        super.init(
            nibName: nil,
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel()
        titleLabel.text = "Расчет стоимости дома VilloziHouse"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.prefersLargeTitles = false
        
        if let image = selectedHouseImage {
            homeImageView.image = image
            homeImageView.contentMode = .scaleAspectFill
        }
        
        houseConfiguration = configurationService.getConfiguration(for: houseId)
        
//        currentData = finishingData
        
        finishingSelectedSingleRow = Array(repeating: nil, count: finishingData.count)
        finishingSelectedMultipleRows = Array(repeating: [], count: finishingData.count)
        
        engineeringSelectedSingleRow = Array(repeating: nil, count: engineeringData.count)
        engineeringSelectedMultipleRows = Array(repeating: [], count: engineeringData.count)
        
        applyDefaultSelection()
        
        setupTableView()
        setupUI()
        updateTotalPriceLabel()
        setupTableHeader()
        
        if segmentControl.selectedSegmentIndex == 2 {
            tableView.reloadData()
        }
    }
    
    // MARK: - Configure UI
    
    private func setupTableHeader() {
        let header = HeaderGalleryView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 216))

        
        let images: [UIImage]
        
        if !houseImages.isEmpty {
            images = houseImages
        } else if let selectedHouseImage {
            images = [selectedHouseImage]
        } else {
            images = [UIImage(systemName: "project127-14-02") ?? UIImage()]
        }
        
        header.configure(images: images)
        tableView.tableHeaderView = header
    }
    
    private func setupUI() {
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        calculatedPrice = "Выбирите комплектацию для рассчета"
        
        
        finalPriceLabel.text = "Итоговая цена: \(calculatedPrice)"
        
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
//        view.addSubview(homeImageView)
        view.addSubview(segmentControl)
        view.addSubview(tableView)
        view.addSubview(finalPriceLabel)
        view.addSubview(applyButton)
        
        NSLayoutConstraint.activate([
//            homeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            homeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            homeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//            homeImageView.heightAnchor.constraint(equalToConstant: 200),
            
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 32),
            
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: finalPriceLabel.topAnchor, constant: -4),
            
            finalPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            finalPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            finalPriceLabel.heightAnchor.constraint(equalToConstant: 36),
            
            applyButton.topAnchor.constraint(equalTo: finalPriceLabel.bottomAnchor, constant: 4),
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
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "CharacteristicCell"
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
        let applicationVC = ApplicationVC(houseName: "", totalPrice: 0, formattedPrice: "\(priceSumm)")
        applicationVC.receivedPrice = finalPriceLabel.text ?? ""
        navigationController?.pushViewController(applicationVC, animated: true)
    }
    
    // MARK: - Actions
    
    @objc private func applyButtonTapped() {
        let totalPrice = calculateTotalSumma()
        let formattedPrice = formatPrice(totalPrice)
        
        let applicationVC = ApplicationVC(
                houseName: "Мой дом",
                totalPrice: totalPrice,
                formattedPrice: formattedPrice
        )
        navigationController?.pushViewController(applicationVC, animated: true)
    }
    
    private func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
    
//    @objc func segmentChanged() {
//        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {
//            if self.segmentControl.selectedSegmentIndex == 0 {
//                self.currentData = self.finishingData
//            } else {
//                self.currentData = self.engineeringData
//            }
//            self.tableView.reloadData()
//        }, completion: nil)
//    }
    @objc func segmentChanged() {
        UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.tableView.reloadData()
        }, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CalculatingTheHouseViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if isCharacteristicsTab {
                    return characteristicsSections.count
                }
                return currentData.count
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCharacteristicsTab {
                    return characteristicsSections[section].options.count
                }
                return currentData[section].options.count
            }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isCharacteristicsTab {
                    return characteristicsSections[section].title
                }
                return currentData[section].title
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isCharacteristicsTab {
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "CharacteristicCell",
                        for: indexPath
                    )
                    
                    let item = characteristicsSections[indexPath.section].options[indexPath.row]
                    
                    // Настройка ячейки с двумя лейблами (слева - параметр, справа - значение)
                    var config = cell.defaultContentConfiguration()
                    config.text = item.title
                    config.secondaryText = item.value
                    config.textProperties.font = UIFont.systemFont(ofSize: 16, weight: .medium)
                    config.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                    config.secondaryTextProperties.color = .systemGray
                    config.textProperties.color = .label
                    
                    cell.contentConfiguration = config
                    cell.selectionStyle = .none // без выделения
                    cell.backgroundColor = .white
                    
                    return cell
                }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CalculatingTheHouseCell.identifier,
            for: indexPath
        ) as? CalculatingTheHouseCell else {
            return UITableViewCell()
        }
        
//        let house = currentData[indexPath.section].options[indexPath.row]
//        let house = filteredSections[indexPath.section].house[indexPath.row]
//        cell.configureImagePage(images: [])
        
//        if house.imageGallery.isEmpty,
//            let image = house.imageProject {
//            if let uiImage = UIImage(named: image) {
//                cell.configureImagePage(images: [uiImage])
//            } else {
//                cell.configureImagePage(images: [UIImage(systemName: "house.fill") ?? UIImage()])
//            }
//            
//        } else {
//            let uiImages = house.imageGallery.compactMap { UIImage(named: $0) }
//            cell.configureImagePage(images: uiImages)
//        }

//        cell.delegate = self
//        return cell
    
        
        
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
        
        if isCharacteristicsTab {
                    tableView.deselectRow(at: indexPath, animated: true)
                    return
                }
        
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
    let navigationController = UINavigationController(
        rootViewController: CalculatingTheHouseViewController(houseId: "127-14-01")
    )
    return navigationController
}
