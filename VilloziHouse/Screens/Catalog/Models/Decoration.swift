//
//  Decoration.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.03.2026.
//

import Foundation
struct HouseConfiguration {
    let houseId: String // Связь с House.id
    // MARK: - Характеристика
    enum HouseTypefoundation: String {
        case none = "Нет"
        case screwPiles = "Винтовые сваи"
        case slab = "Плита"
        case concretePiles = "Бетонные сваи"
    }
    enum SipType: String {
        case none = "Нет"
        case skeleton45 = "Каркас 45 мм"
        case skeleton145 = "Каркас 145 мм"
        case skeleton195 = "Каркас 195 мм"
        case sip121 = "Сип панели 121 мм"
        case sip171 = "Сип панели 171 мм"
        case sip221 = "Сип панели 221 мм"
    }
    struct HouseType {
        let foundation: HouseTypefoundation // фундамент
        let overlap: SipType //Перекрытие
        let exteriorWalls: SipType //Внешние стены
        let internalWalls: SipType //Внутренние стены
        let overlapTwo: SipType //Перекрытие 2
        let exteriorWallsTwo: SipType //Внешние стены2
        let internalWallsTwo: SipType //Внутренние стены2
        let overlapThree: SipType //Перекрытие 3
        let exteriorWallsThree: SipType //Внешние стены3
        let internalWallsThree: SipType //Внутренние стены3
        let roofMaterial: SipType //Крыша
    }
    
    // MARK: - 1. Комплект дома
    struct HouseKit {
        let cutPanels: Double          // Набор раскроенных панелей
        let dryLumber: Double          // Пиломатериал сухой строганый
        let gluedBeam: Double          // Клееный брус
        let fastener: Double           // Крепеж (41 мм, 75 мм, 120 мм.)
        let powerFastener: Double      // Специализированный силовой крепеж (180мм - 360мм)
        let insulationMaterials: Double // Материалы, улучшающие теплоизоляцию и герметичность
        let professionalInstallation: Double // Профессиональный монтаж
        let foundationSlab: Double     // Монтаж фундамента - Плита
        let household: Double //бытовка
        
        var total: Double {
            cutPanels + dryLumber + gluedBeam + fastener + powerFastener + insulationMaterials + professionalInstallation + foundationSlab
        }
    }
    // MARK: - 2. Кровля (Варианты)
    struct RoofingOptions {
        let metalTile: Double          // Металлочерепица
        let bitumenShingle: Double     // Битумная черепица
        let seamRoof: Double           // Фальцевая кровля
        let corrugatedSheet: Double    // Профнастил кровельный
        let builtUpRoof: Double        // Наплавляемая кровля
    }
    // MARK: - 3. На кровлю
    struct RoofAccessories {
        let ventilationElements: Double // Вентиляционные элементы Vilpe
        let gutterSystem: Double        // Водосточная система
    }
    // MARK: - 4. Фасад (Варианты)
    struct FacadeOptions {
        let vinylSiding: Double         // Виниловый сайдинг
        let vinylPanels: Double         // Виниловые фасадные панели
        let woodImitation: Double       // Деревянная отделка. Имитация бруса
        let fiberCementSiding: Double   // Фиброцементный сайдинг
        let hauberkBrick: Double        // Фасад под кирпич Хауберк
        let fold: Double                // Фальц
        let wallCorrugatedSheet: Double // Профнастил стеновой
        let metalSiding: Double         // Металлический сайдинг
        let clinkerTile: Double         // Клинкерная плитка
        let facadeConservation: Double  // Консервация фасада
    }
    // MARK: - 5. Торцы крыши
    struct GableEndOptions {
        let vinylJTrim: Double          // Виниловая J-фаска
        let wood: Double                // Дерево
        let metalLTrim: Double          // Металлическая L-планка
    }
    // MARK: - 6. Свесы крыши, потолки над террасами и балконами
    struct SoffitOptions {
        let vinylSoffit: Double         // Виниловые софиты
        let wood: Double                // Дерево
        let fiberCementSiding: Double   // Фиброцементный сайдинг
        let metalSoffit: Double         // Металлические софиты
    }
    // MARK: - 7. Окна и двери
    struct WindowsDoors {
        let aluminumDoors: Double       // Алюминиевые двери
        let metalPlasticWindows: Double // Металлопластиковые окна и двери
    }
    // MARK: - 8. Балконы, террасы, лестницы
    struct Terraces {
        let terraceWaterproofing: Double // Гидроизоляция террас
        
        struct BeamFinishing {
            let puttyAndPaint: Double    // Шпатлевка и окрашивание
        }
        let beamFinishing: BeamFinishing
    }
    // MARK: - 9. Настил на террасах
    struct TerraceDeckingOptions {
        let woodenDecking: Double       // Террасная доска
        let compositeDecking: Double    // Террасная доска искусственная (ДПК)
        let sheetMaterials: Double      // Листовые материалы
    }
    // MARK: - Отопление
    
    struct Engineer {
        let electricS: Double
        let gas: Double
        let tverd: Double
        let teploNasos: Double
        let radiator: Double
        let tepliyPol: Double
    }
    // MARK: - 10. Инженерка
    
    let houseType: HouseType
    let houseKit: HouseKit
    let roofingOptions: RoofingOptions
    let roofAccessories: RoofAccessories
    let facadeOptions: FacadeOptions
    let gableEndOptions: GableEndOptions
    let soffitOptions: SoffitOptions
    let windowsDoors: WindowsDoors
    let terraces: Terraces
    let terraceDeckingOptions: TerraceDeckingOptions
    let houseEngineer: Engineer
    
    init(houseId: String) {
        self.houseId = houseId
        switch houseId {
            
        case "127-14":
            self.houseEngineer = Engineer(
                electricS: 123,
                gas: 1234,
                tverd: 12345,
                teploNasos: 123456,
                radiator: 1234567,
                tepliyPol: 12345678
            )
            self.houseType = HouseType(
                foundation: .screwPiles,
                overlap: .sip171,
                exteriorWalls: .sip171,
                internalWalls: .sip171,
                overlapTwo: .sip171,
                exteriorWallsTwo: .sip171,
                internalWallsTwo: .sip171,
                overlapThree: .none,
                exteriorWallsThree: .none,
                internalWallsThree: .none,
                roofMaterial: .sip221
            )
            self.houseKit = HouseKit(
                cutPanels: 399689,
                dryLumber: 200000,
                gluedBeam: 367524,
                fastener: 41569,
                powerFastener: 545879,
                insulationMaterials: 62377,
                professionalInstallation: 599689,
                foundationSlab: 224000, household: 0
            )
            self.roofingOptions = RoofingOptions(
                metalTile: 226800,
                bitumenShingle: 0,
                seamRoof: 0,
                corrugatedSheet: 0,
                builtUpRoof: 321120
            )
            self.roofAccessories = RoofAccessories(
                ventilationElements: 41700,
                gutterSystem: 22880
            )
            self.facadeOptions = FacadeOptions(
                vinylSiding: 411750,// Виниловый сайдинг
                vinylPanels: 611550,// Виниловые фасадные панели
                woodImitation: 0,// Деревянная отделка. Имитация бруса,
                fiberCementSiding: 882900,// Фиброцементный сайдинг3 100,
                hauberkBrick: 683100,// Фасад под кирпич Хауберк
                fold: 0,// Фальц
                wallCorrugatedSheet: 0,// Профнастил стеновой1128616,
                metalSiding: 611750,// Металлический сайдинг
                clinkerTile: 1411750,// Клинкерная плитка
                facadeConservation: 94500// Консервация фасада
            )
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 71250,// Виниловая J-фаска
                wood: 127997,// Дерево
                metalLTrim: 116371// Металлическая L-планка
            )
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 172658,// Виниловые софиты
                wood: 277132,// Дерево
                fiberCementSiding: 447458,// Фиброцементный сайдинг
                metalSoffit: 287410// Металлические софиты
            )
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 250699,// Алюминиевые двери
                metalPlasticWindows: (289170 + 53600)// Металлопластиковые окна и двери
            )
            self.terraces = Terraces(
                terraceWaterproofing: 280627,// Гидроизоляция террас
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 54569)// Гидроизоляция террас
            )
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 203562,// Террасная доска
                compositeDecking: 271197,// Террасная доска искусственная (ДПК)
                sheetMaterials: 141531// Листовые материалы
            )
        case "60-23":
            self.houseEngineer = Engineer(
                electricS: 123,
                gas: 1234,
                tverd: 12345,
                teploNasos: 123456,
                radiator: 1234567,
                tepliyPol: 12345678
            )
            self.houseType = HouseType(
                foundation: .screwPiles,
                overlap: .sip171,
                exteriorWalls: .sip171,
                internalWalls: .skeleton145,
                overlapTwo: .none,
                exteriorWallsTwo: .none,
                internalWallsTwo: .none,
                overlapThree: .none,
                exteriorWallsThree: .none,
                internalWallsThree: .none,
                roofMaterial: .sip171
            )
            self.houseKit = HouseKit(
                cutPanels: 6023,
                dryLumber: 6023,
                gluedBeam: 6023,
                fastener: 6023,
                powerFastener: 6023,
                insulationMaterials: 6023,
                professionalInstallation: 6023,
                foundationSlab: 6023, household: 0
            )
            
            self.roofingOptions = RoofingOptions(
                metalTile: 378793,
                bitumenShingle: 469722,
                seamRoof: 565608,
                corrugatedSheet: 414337,
                builtUpRoof: 590537
            )
            
            self.roofAccessories = RoofAccessories(
                ventilationElements: 65000,
                gutterSystem: 105260
            )
            
            self.facadeOptions = FacadeOptions(
                vinylSiding: 440905,
                vinylPanels: 498662,
                woodImitation: 665298,
                fiberCementSiding: 1116033,
                hauberkBrick: 755887,
                fold: 752975,
                wallCorrugatedSheet: 752975,
                metalSiding: 678633,
                clinkerTile: 1515379,
                facadeConservation: 68922
            )
            
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 42732,
                wood: 76765,
                metalLTrim: 69792
            )
            
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 64680,
                wood: 103817,
                fiberCementSiding: 167624,
                metalSoffit: 107667
            )
            
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 185000,
                metalPlasticWindows: 388154
            )
            
            self.terraces = Terraces(
                terraceWaterproofing: 185000,
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 42000)
            )
            
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 185000,
                compositeDecking: 245000,
                sheetMaterials: 128000
            )
        case "129-14":
            self.houseEngineer = Engineer(
                electricS: 123,
                gas: 1234,
                tverd: 12345,
                teploNasos: 123456,
                radiator: 1234567,
                tepliyPol: 12345678
            )
            self.houseType = HouseType(
                foundation: .screwPiles,
                overlap: .sip171,
                exteriorWalls: .sip171,
                internalWalls: .skeleton145,
                overlapTwo: .sip171,
                exteriorWallsTwo: .sip171,
                internalWallsTwo: .skeleton145,
                overlapThree: .none,
                exteriorWallsThree: .none,
                internalWallsThree: .none,
                roofMaterial: .sip221
            )
            self.houseKit = HouseKit(
                cutPanels: 918908.7,
                dryLumber: 707180,
                gluedBeam: 46683,
                fastener: 20891,
                powerFastener: 13033,
                insulationMaterials: 38065,
                professionalInstallation: 710745,
                foundationSlab: 229863,
                household: 90000
            )
            
            self.roofingOptions = RoofingOptions(
                metalTile: 0,
                bitumenShingle: 0,
                seamRoof: 550738,
                corrugatedSheet: 0,
                builtUpRoof: 0
            )
            
            self.roofAccessories = RoofAccessories(
                ventilationElements: 79947,
                gutterSystem: 58211
            )
            
            self.facadeOptions = FacadeOptions(
                vinylSiding: 714050,
                vinylPanels: 807589,
                woodImitation: 1077457,
                fiberCementSiding: 1807428,
                hauberkBrick: 1224168,
                fold: 1219451,
                wallCorrugatedSheet: 1219451,
                metalSiding: 1099053,
                clinkerTile: 2454172,
                facadeConservation: 111621
            )
            
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 49672,
                wood: 89233,
                metalLTrim: 81128
            )
            
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 75861,
                wood: 121764,
                fiberCementSiding: 196600,
                metalSoffit: 126279
            )
            
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 125349,
                metalPlasticWindows: 344734
            )
            
            self.terraces = Terraces(
                terraceWaterproofing: 22303,
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 9009)
            )
            
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 30057,
                compositeDecking: 40044,
                sheetMaterials: 20898
            )
        case "01-24":
            self.houseEngineer = Engineer(
                electricS: 123,
                gas: 1234,
                tverd: 12345,
                teploNasos: 123456,
                radiator: 1234567,
                tepliyPol: 12345678
            )
            self.houseType = HouseType(
                foundation: .screwPiles,
                overlap: .sip171,
                exteriorWalls: .sip171,
                internalWalls: .skeleton145,
                overlapTwo: .skeleton145,
                exteriorWallsTwo: .skeleton145,
                internalWallsTwo: .none,
                overlapThree: .none,
                exteriorWallsThree: .none,
                internalWallsThree: .none,
                roofMaterial: .sip171
            )
            self.houseKit = HouseKit(
                cutPanels: 760495,// Набор раскроенных панелей
                dryLumber: 860707,// Пиломатериал сухой строганый
                gluedBeam: 256976,// Клееный брус
                fastener: 29565,// Крепеж (41 мм, 75 мм, 120 мм.)
                powerFastener: 25514,// Специализированный силовой крепеж (180мм - 360мм)
                insulationMaterials: 62893,// Материалы, улучшающие теплоизоляцию и герметичность
                professionalInstallation: 873203,// Профессиональный монтаж
                foundationSlab: 491651, // Монтаж фундамента - Плита
                household: 95000//бытовка
            )
            
            self.roofingOptions = RoofingOptions(
                metalTile: 700374,// Металлочерепица
                bitumenShingle: 868499,// Битумная черепица
                seamRoof: 1045787,// Фальцевая кровля
                corrugatedSheet: 766093,// Профнастил кровельный
                builtUpRoof: 1091880// Наплавляемая кровля
            )
            
            self.roofAccessories = RoofAccessories(
                ventilationElements: 79947,// Вентиляционные элементы Vilpe
                gutterSystem: 129597// Водосточная система
            )
            
            self.facadeOptions = FacadeOptions(
                vinylSiding: 531803,// Виниловый сайдинг
                vinylPanels: 601468,// Виниловые фасадные панели
                woodImitation: 802459,// Деревянная отделка. Имитация бруса
                fiberCementSiding: 1346119,// Фиброцементный сайдинг
                hauberkBrick: 911724,// Фасад под кирпич Хауберк
                fold: 908211,// Фальц
                wallCorrugatedSheet: 908211,// Профнастил стеновой
                metalSiding: 818542,// Металлический сайдинг
                clinkerTile: 1827795,// Клинкерная плитка
                facadeConservation: 83132// Консервация фасада
            )
            
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 80900,// Виниловая J-фаска
                wood: 145332,// Дерево
                metalLTrim: 132132// Металлическая L-планка
            )
            
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 212852,// Виниловые софиты
                wood: 341647,// Дерево
                fiberCementSiding: 551624,// Фиброцементный сайдинг
                metalSoffit: 354317// Металлические софиты
            )
            
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 95000,// Алюминиевые двери
                metalPlasticWindows: 529022// Металлопластиковые окна и двери
            )
            
            self.terraces = Terraces(
                terraceWaterproofing: 0,// Гидроизоляция террас
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 72486)// Шпатлевка и окрашивание
            )
            
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 471778,// Террасная доска
                compositeDecking: 628529,// Террасная доска искусственная (ДПК)
                sheetMaterials: 328014// Листовые материалы
            )
        default:
            self.houseEngineer = Engineer(
                electricS: 123,
                gas: 1234,
                tverd: 12345,
                teploNasos: 123456,
                radiator: 1234567,
                tepliyPol: 12345678
            )
            self.houseType = HouseType(
                foundation: .none,
                overlap: .none,
                exteriorWalls: .none,
                internalWalls: .none,
                overlapTwo: .none,
                exteriorWallsTwo: .none,
                internalWallsTwo: .none,
                overlapThree: .none,
                exteriorWallsThree: .none,
                internalWallsThree: .none,
                roofMaterial: .none
            )
            self.houseKit = HouseKit(
                cutPanels: 00,
                dryLumber: 00,
                gluedBeam: 00,
                fastener: 00,
                powerFastener: 00,
                insulationMaterials: 00,
                professionalInstallation: 00,
                foundationSlab: 000, household: 000
            )
            
            self.roofingOptions = RoofingOptions(
                metalTile: 604174,
                bitumenShingle: 749206,
                seamRoof: 902142,
                corrugatedSheet: 660866,
                builtUpRoof: 941905
            )
            
            self.roofAccessories = RoofAccessories(
                ventilationElements: 79947,
                gutterSystem: 150330
            )
            
            self.facadeOptions = FacadeOptions(
                vinylSiding: 660861,
                vinylPanels: 747432,
                woodImitation: 997199,
                fiberCementSiding: 1672795,
                hauberkBrick: 1132981,
                fold: 1128616,
                wallCorrugatedSheet: 1128616,
                metalSiding: 1017186,
                clinkerTile: 2271363,
                facadeConservation: 103306
            )
            
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 71250,
                wood: 127997,
                metalLTrim: 116371
            )
            
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 172658,
                wood: 277132,
                fiberCementSiding: 447458,
                metalSoffit: 287410
            )
            
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 250699,
                metalPlasticWindows: 282646
            )
            
            self.terraces = Terraces(
                terraceWaterproofing: 280627,
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 54569)
            )
            
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 203562,
                compositeDecking: 271197,
                sheetMaterials: 141531
            )
        }
    }
}

