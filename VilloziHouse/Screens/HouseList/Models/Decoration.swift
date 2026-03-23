//
//  Decoration.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.03.2026.
//

import Foundation

struct HouseConfiguration {
    let houseId: String // Связь с House.id
    
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
    
    let houseKit: HouseKit
    let roofingOptions: RoofingOptions
    let roofAccessories: RoofAccessories
    let facadeOptions: FacadeOptions
    let gableEndOptions: GableEndOptions
    let soffitOptions: SoffitOptions
    let windowsDoors: WindowsDoors
    let terraces: Terraces
    let terraceDeckingOptions: TerraceDeckingOptions
    
    init(houseId: String) {
        self.houseId = houseId
        
        switch houseId {
        case "124-14":
            self.houseKit = HouseKit(
                cutPanels: 1,
                dryLumber: 2,
                gluedBeam: 3,
                fastener: 4,
                powerFastener: 5,
                insulationMaterials: 6,
                professionalInstallation: 7,
                foundationSlab: 8
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
        case "60-23":
            self.houseKit = HouseKit(
                cutPanels: 6023,
                dryLumber: 6023,
                gluedBeam: 6023,
                fastener: 6023,
                powerFastener: 6023,
                insulationMaterials: 6023,
                professionalInstallation: 6023,
                foundationSlab: 6023
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
            
        case "01-24":
            self.houseKit = HouseKit(
                cutPanels: 0124,
                dryLumber: 0124,
                gluedBeam: 0124,
                fastener: 0124,
                powerFastener: 0124,
                insulationMaterials: 0124,
                professionalInstallation: 0124,
                foundationSlab: 0124
            )
            
            self.roofingOptions = RoofingOptions(
                metalTile: 485000,
                bitumenShingle: 595000,
                seamRoof: 715000,
                corrugatedSheet: 525000,
                builtUpRoof: 745000
            )
            
            self.roofAccessories = RoofAccessories(
                ventilationElements: 72000,
                gutterSystem: 128000
            )
            
            self.facadeOptions = FacadeOptions(
                vinylSiding: 550000,
                vinylPanels: 625000,
                woodImitation: 825000,
                fiberCementSiding: 1380000,
                hauberkBrick: 940000,
                fold: 935000,
                wallCorrugatedSheet: 935000,
                metalSiding: 845000,
                clinkerTile: 1880000,
                facadeConservation: 85000
            )
            
            self.gableEndOptions = GableEndOptions(
                vinylJTrim: 55000,
                wood: 98000,
                metalLTrim: 89000
            )
            
            self.soffitOptions = SoffitOptions(
                vinylSoffit: 132000,
                wood: 212000,
                fiberCementSiding: 342000,
                metalSoffit: 220000
            )
            
            self.windowsDoors = WindowsDoors(
                aluminumDoors: 218000,
                metalPlasticWindows: 312000
            )
            
            self.terraces = Terraces(
                terraceWaterproofing: 225000,
                beamFinishing: Terraces.BeamFinishing(puttyAndPaint: 48000)
            )
            
            self.terraceDeckingOptions = TerraceDeckingOptions(
                woodenDecking: 204000,
                compositeDecking: 272000,
                sheetMaterials: 142000
            )
        default: 
            self.houseKit = HouseKit(
                cutPanels: 00,
                dryLumber: 00,
                gluedBeam: 00,
                fastener: 00,
                powerFastener: 00,
                insulationMaterials: 00,
                professionalInstallation: 00,
                foundationSlab: 000
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
