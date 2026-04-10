//
//  CatalogExteriorDecorationDataSourse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.03.2026.


import UIKit

class CatalogExteriorDecorationDataSourse {
    private var configurations: [String: HouseConfiguration] = [:]
        
        init() {
            
        }
        
        func getConfiguration(for houseId: String) -> HouseConfiguration? {
            return HouseConfiguration(houseId: houseId)
        }
        
        func setConfiguration(_ configuration: HouseConfiguration, for houseId: String) {
            configurations[houseId] = configuration
        }
}

// MARK: - Data
    
//    var finishingData: [Category] {
//        return [
//            createHouseKitCategory(),
//            createRoofingCategory(),
//            createRoofAccessoriesCategory(),
//            createFacadeCategory(),
//            createGableEndCategory(),
//            createSoffitCategory(),
//            createWindowsDoorsCategory(),
//            createTerracesCategory(),
//            createBeamFinishingCategory(),
//            createTerraceDeckingCategory()
//        ]
//    }
//    
//    private func createHouseKitCategory() -> Category {
//        let kit = houseConfiguration?.houseKit ?? HouseConfiguration.HouseKit(
//            cutPanels: 0,//Обрезные панели
//            dryLumber: 0,//пиломатериалы
//            gluedBeam: 0,//клееный брус
//            fastener: 0,//крепеж
//            powerFastener: 0,//силовой крепеж
//            insulationMaterials: 0,//изоляционные материалы
//            professionalInstallation: 0,//профессиональный монтаж
//            foundationSlab: 0//фундамент
//        )
//        
//        return Category(
//            title: "Комплект дома",
//            selectionType: .multiple,
//            options: [
//                FinishingOption(
//                    id: "kit_1",
//                    title: "Набор раскроенных панелей",
//                    deltaRub: kit.cutPanels, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_2",
//                    title: "Пиломатериал сухой строганый",
//                    deltaRub: kit.dryLumber, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_3",
//                    title: "Клееный брус",
//                    deltaRub: kit.gluedBeam,
//                    isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_4",
//                    title: "Крепеж (41 мм, 75 мм, 120 мм.)",
//                    deltaRub: kit.fastener, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_5",
//                    title: "Специализированный силовой крепеж (180мм - 360мм)",
//                    deltaRub: kit.powerFastener, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_6",
//                    title: "Материалы, улучшающие теплоизоляцию и герметичность дома:",
//                    deltaRub: kit.insulationMaterials, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_7", //"professinnal_montage"
//                    title: "Профессиональный монтаж:",
//                    deltaRub: kit.professionalInstallation, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_8",
//                    title: "Монтаж фундамента-железобетонные сваи:",
//                    deltaRub: kit.foundationSlab, isDefaultSelected: true
//                ),
//                FinishingOption(
//                    id: "kit_9",
//                    title: "Бытовка, снегозадержетели, доставка, биотуалет, укрывные тенты, подкладные доски, временная лестница:",
//                    deltaRub: 90000.00, isDefaultSelected: true
//                )
//            ]
//        )
//    }
//    private func createRoofingCategory() -> Category {
//        let roofing = houseConfiguration?.roofingOptions ?? HouseConfiguration.RoofingOptions(
//            metalTile: 0,
//            bitumenShingle: 0,
//            seamRoof: 0,
//            corrugatedSheet: 0,
//            builtUpRoof: 0
//        )
//        
//        return Category(
//            title: "Кровля",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "roof_1",
//                    title: "Металлочерепица",
//                    deltaRub: 378793, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "roof_2",
//                    title: "Фальцевая кровля",
//                    deltaRub: 565608, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "roof_3",
//                    title: "Наплавляемая кровля",
//                    deltaRub: 590537, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "roof_4",
//                    title: "Битумная черепица",
//                    deltaRub: 469722, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "roof_5",
//                    title: "Профнастил кровельный",
//                    deltaRub: 414337, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createRoofAccessoriesCategory() -> Category {
//        let accessories = houseConfiguration?.roofAccessories ?? HouseConfiguration.RoofAccessories(
//            ventilationElements: 0,
//            gutterSystem: 0
//        )
//        
//        return Category(
//            title: "На кровлю",
//            selectionType: .multiple,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Вентиляционные элементы Vilpe. Количество по проекту",
//                    deltaRub: 79947, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "2",
//                    title: "Водосточная система",
//                    deltaRub: 105260, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createFacadeCategory() -> Category {
//        let facade = houseConfiguration?.facadeOptions ?? HouseConfiguration.FacadeOptions(
//            vinylSiding: 0,
//            vinylPanels: 0,
//            woodImitation: 0,
//            fiberCementSiding: 0,
//            hauberkBrick: 0,
//            fold: 0,
//            wallCorrugatedSheet: 0,
//            metalSiding: 0,
//            clinkerTile: 0,
//            facadeConservation: 0
//        )
//        
//        return Category(
//            title: "Фасад",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Виниловый сайдинг",
//                    deltaRub: 440905, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "2",
//                    title: "Деревянная отделка. Имитация бруса",
//                    deltaRub: 665298, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "3",
//                    title: "Фасад под кирпич Хауберк",
//                    deltaRub: 755887, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "4",
//                    title: "Профнастил стеновой",
//                    deltaRub: 752975, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "5",
//                    title: "Клинкерная плитка",
//                    deltaRub: 1515379, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "6",
//                    title: "Виниловые фасадные панели",
//                    deltaRub: 498662, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "7",
//                    title: "Фиброцементный сайдинг",
//                    deltaRub: 1116033, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "8",
//                    title: "Фальц",
//                    deltaRub: 752975, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "9",
//                    title: "Металлический сайдинг",
//                    deltaRub: 678633, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "10",
//                    title: "Клинкерные термопанели",
//                    deltaRub: 450112, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "11",
//                    title: "Консервация фасада",
//                    deltaRub: 68922, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createGableEndCategory() -> Category {
//        let gable = houseConfiguration?.gableEndOptions ?? HouseConfiguration.GableEndOptions(
//            vinylJTrim: 0,
//            wood: 0,
//            metalLTrim: 0
//        )
//        
//        return Category(
//            title: "Торцы крыши",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Виниловая J-фаска",
//                    deltaRub: 42732, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "2",
//                    title: "Металлическая L-планка",
//                    deltaRub: 69792, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "3",
//                    title: "Дерево",
//                    deltaRub: 76765, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createSoffitCategory() -> Category {
//        let soffit = houseConfiguration?.soffitOptions ?? HouseConfiguration.SoffitOptions(
//            vinylSoffit: 0,
//            wood: 0,
//            fiberCementSiding: 0,
//            metalSoffit: 0
//        )
//        
//        return Category(
//            title: "Свесы крыши, потолки над террасами и балконами",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Виниловые софиты",
//                    deltaRub: 64680, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "2",
//                    title: "Фиброцементный сайдинг",
//                    deltaRub: 167624, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "3",
//                    title: "Дерево",
//                    deltaRub: 103817, isDefaultSelected: false
//                ),FinishingOption(
//                    id: "4",
//                    title: "Металлические софиты",
//                    deltaRub: 107667, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createWindowsDoorsCategory() -> Category {
//        let windowsDoors = houseConfiguration?.windowsDoors ?? HouseConfiguration.WindowsDoors(
//            aluminumDoors: 0,
//            metalPlasticWindows: 0
//        )
//        
//        return Category(
//            title: "Окна и двери",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "windows_1",
//                    title: "Металлопластиковые окна и двери",
//                    deltaRub: windowsDoors.metalPlasticWindows,
//                    isDefaultSelected: false
//                ),
//                FinishingOption(
//                    id: "windows_2",
//                    title: "Алюминиевые двери",
//                    deltaRub: windowsDoors.aluminumDoors,
//                    isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createTerracesCategory() -> Category {
//        let terraces = houseConfiguration?.terraces ?? HouseConfiguration.Terraces(
//            terraceWaterproofing: 0,
//            beamFinishing: HouseConfiguration.Terraces.BeamFinishing(puttyAndPaint: 0)
//        )
//        
//        return Category(
//            title: "Балконы, террасы, лестницы",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Деревянные горизонтальные типовые",
//                    deltaRub: 200928, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createBeamFinishingCategory() -> Category {
//        let beamFinishing = houseConfiguration?.terraces.beamFinishing ?? HouseConfiguration.Terraces.BeamFinishing(puttyAndPaint: 0)
//        
//        return Category(
//            title: "Отделка балок и стоек на террасе и балконе",
//            selectionType: .single,
//            options: [
//                FinishingOption(
//                    id: "1",
//                    title: "Шпатлевка и окрашивание",
//                    deltaRub: 53374, isDefaultSelected: false
//                )
//            ]
//        )
//    }
//    private func createTerraceDeckingCategory() -> Category {
//        let decking = houseConfiguration?.terraceDeckingOptions ?? HouseConfiguration.TerraceDeckingOptions(
//            woodenDecking: 0,
//            compositeDecking: 0,
//            sheetMaterials: 0
//        )
//        
//        return Category(
//            title: "Настил на террасах",
//            selectionType: .single,
//            options: [FinishingOption(id: "1", title: "Террасная доска", deltaRub: 262559, isDefaultSelected: false),FinishingOption(
//                id: "1",
//                title: "Листовые материалы",
//                deltaRub: 182550, isDefaultSelected: false
//            ),FinishingOption(
//                id: "1",
//                title: "Террасная доска искусственная (ДПК)",
//                deltaRub: 349796, isDefaultSelected: false
//            )
//            ]
//        )
//    }
