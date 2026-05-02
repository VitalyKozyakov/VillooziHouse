//
//  HouseCalculatorSectionsBuilder.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.04.2026.
//

import Foundation

struct HouseCalculatorSections {
    let finishing: [OptionSection]
    let engineering: [OptionSection]
    let characteristics: [CharacteristicSection]
}

struct HouseCalculatorSectionsBuilder {
    func build(from configuration: HouseConfiguration?) -> HouseCalculatorSections {
        let finishing = buildFinishingSections(from: configuration)
        let engineering = buildEngineeringSections()
        let characteristics = buildCharacteristicSections(from: configuration)
        
        return HouseCalculatorSections(
            finishing: finishing,
            engineering: engineering,
            characteristics: characteristics
        )
    }
    
    private func buildFinishingSections(from configuration: HouseConfiguration?) -> [OptionSection] {
        guard let configuration else { return [] }
        
        return [
            houseKitSection(from: configuration),
            roofingSection(from: configuration),
            roofAccessoriesSection(from: configuration),
            facadeSection(from: configuration),
            gableEndSection(from: configuration),
            soffitSection(from: configuration),
            windowsDoorsSection(from: configuration),
            terracesSection(from: configuration),
            beamFinishingSection(from: configuration),
            terraceDeckingSection(from: configuration)
        ]
    }
    
    private func houseKitSection(from configuration: HouseConfiguration) -> OptionSection {
        let kit = configuration.houseKit
        
        return OptionSection(
            title: "Комплект дома",
            selectionType: .multiple,
            options: [
                OptionItem(id: "kit_1", title: "Набор раскроенных панелей", deltaRub: kit.cutPanels, isDefaultSelected: true),
                OptionItem(id: "kit_2", title: "Пиломатериал сухой строганый", deltaRub: kit.dryLumber, isDefaultSelected: true),
                OptionItem(id: "kit_3", title: "Клееный брус", deltaRub: kit.gluedBeam, isDefaultSelected: true),
                OptionItem(id: "kit_4", title: "Крепеж (41 мм, 75 мм, 120 мм.)", deltaRub: kit.fastener, isDefaultSelected: true),
                OptionItem(id: "kit_5", title: "Специализированный силовой крепеж (180мм - 360мм)", deltaRub: kit.powerFastener, isDefaultSelected: true),
                OptionItem(id: "kit_6", title: "Материалы, улучшающие теплоизоляцию и герметичность дома", deltaRub: kit.insulationMaterials, isDefaultSelected: true),
                OptionItem(id: "kit_7", title: "Профессиональный монтаж", deltaRub: kit.professionalInstallation, isDefaultSelected: true),
                OptionItem(id: "kit_8", title: "Монтаж фундамента", deltaRub: kit.foundationSlab, isDefaultSelected: true),
                OptionItem(id: "kit_9", title: "Бытовка, снегозадержатели, доставка, биотуалет и т.д.", deltaRub: kit.household, isDefaultSelected: true)
            ]
        )
    }
    
    private func roofingSection(from configuration: HouseConfiguration) -> OptionSection {
        let roofing = configuration.roofingOptions
        
        return OptionSection(
            title: "Кровля",
            selectionType: .single,
            options: [
                OptionItem(id: "roof_1", title: "Металлочерепица", deltaRub: roofing.metalTile, isDefaultSelected: false),
                OptionItem(id: "roof_2", title: "Битумная черепица", deltaRub: roofing.bitumenShingle, isDefaultSelected: false),
                OptionItem(id: "roof_3", title: "Фальцевая кровля", deltaRub: roofing.seamRoof, isDefaultSelected: false),
                OptionItem(id: "roof_4", title: "Профнастил кровельный", deltaRub: roofing.corrugatedSheet, isDefaultSelected: false),
                OptionItem(id: "roof_5", title: "Наплавляемая кровля", deltaRub: roofing.builtUpRoof, isDefaultSelected: false)
            ]
        )
    }
    
    private func roofAccessoriesSection(from configuration: HouseConfiguration) -> OptionSection {
        let accessories = configuration.roofAccessories
        
        return OptionSection(
            title: "На кровлю",
            selectionType: .multiple,
            options: [
                OptionItem(id: "roof_accessory_1", title: "Вентиляционные элементы Vilpe", deltaRub: accessories.ventilationElements, isDefaultSelected: false),
                OptionItem(id: "roof_accessory_2", title: "Водосточная система", deltaRub: accessories.gutterSystem, isDefaultSelected: false)
            ]
        )
    }
    
    private func facadeSection(from configuration: HouseConfiguration) -> OptionSection {
        let facade = configuration.facadeOptions
        
        return OptionSection(
            title: "Фасад",
            selectionType: .single,
            options: [
                OptionItem(id: "facade_1", title: "Виниловый сайдинг", deltaRub: facade.vinylSiding, isDefaultSelected: false),
                OptionItem(id: "facade_2", title: "Виниловые фасадные панели", deltaRub: facade.vinylPanels, isDefaultSelected: false),
                OptionItem(id: "facade_3", title: "Деревянная отделка. Имитация бруса", deltaRub: facade.woodImitation, isDefaultSelected: false),
                OptionItem(id: "facade_4", title: "Фиброцементный сайдинг", deltaRub: facade.fiberCementSiding, isDefaultSelected: false),
                OptionItem(id: "facade_5", title: "Фасад под кирпич Хауберк", deltaRub: facade.hauberkBrick, isDefaultSelected: false),
                OptionItem(id: "facade_6", title: "Фальц", deltaRub: facade.fold, isDefaultSelected: false),
                OptionItem(id: "facade_7", title: "Профнастил стеновой", deltaRub: facade.wallCorrugatedSheet, isDefaultSelected: false),
                OptionItem(id: "facade_8", title: "Металлический сайдинг", deltaRub: facade.metalSiding, isDefaultSelected: false),
                OptionItem(id: "facade_9", title: "Клинкерная плитка", deltaRub: facade.clinkerTile, isDefaultSelected: false),
                OptionItem(id: "facade_10", title: "Консервация фасада", deltaRub: facade.facadeConservation, isDefaultSelected: false)
            ]
        )
    }
    
    private func gableEndSection(from configuration: HouseConfiguration) -> OptionSection {
        let gable = configuration.gableEndOptions
        
        return OptionSection(
            title: "Торцы крыши",
            selectionType: .single,
                        options: [
                OptionItem(id: "gable_1", title: "Виниловая J-фаска", deltaRub: gable.vinylJTrim, isDefaultSelected: false),
                OptionItem(id: "gable_2", title: "Дерево", deltaRub: gable.wood, isDefaultSelected: false),
                OptionItem(id: "gable_3", title: "Металлическая L-планка", deltaRub: gable.metalLTrim, isDefaultSelected: false)
            ]
        )
    }
    
    private func soffitSection(from configuration: HouseConfiguration) -> OptionSection {
        let soffit = configuration.soffitOptions
        
        return OptionSection(
            title: "Свесы крыши, потолки над террасами и балконами",
            selectionType: .single,
                        options: [
                OptionItem(id: "soffit_1", title: "Виниловые софиты", deltaRub: soffit.vinylSoffit, isDefaultSelected: false),
                OptionItem(id: "soffit_2", title: "Дерево", deltaRub: soffit.wood, isDefaultSelected: false),
                OptionItem(id: "soffit_3", title: "Фиброцементный сайдинг", deltaRub: soffit.fiberCementSiding, isDefaultSelected: false),
                OptionItem(id: "soffit_4", title: "Металлические софиты", deltaRub: soffit.metalSoffit, isDefaultSelected: false)
            ]
        )
    }
    
    private func windowsDoorsSection(from configuration: HouseConfiguration) -> OptionSection {
        let windowsDoors = configuration.windowsDoors
        
        return OptionSection(
            title: "Окна и двери",
            selectionType: .multiple,
                        options: [
                OptionItem(id: "windows_1", title: "Алюминиевые двери", deltaRub: windowsDoors.aluminumDoors, isDefaultSelected: false),
                OptionItem(id: "windows_2", title: "Металлопластиковые окна и двери", deltaRub: windowsDoors.metalPlasticWindows, isDefaultSelected: false)
            ]
        )
    }
    
    private func terracesSection(from configuration: HouseConfiguration) -> OptionSection {
        let terraces = configuration.terraces
        
        return OptionSection(
            title: "Балконы, террасы, лестницы",
            selectionType: .single,
                        options: [
                OptionItem(id: "terraces_1", title: "Гидроизоляция террас", deltaRub: terraces.terraceWaterproofing, isDefaultSelected: false)
            ]
        )
    }
    
    private func beamFinishingSection(from configuration: HouseConfiguration) -> OptionSection {
        let beamFinishing = configuration.terraces.beamFinishing
        
        return OptionSection(
            title: "Отделка балок и стоек на террасе и балконе",
            selectionType: .single,
                        options: [
                OptionItem(id: "beam_1", title: "Шпатлевка и окрашивание", deltaRub: beamFinishing.puttyAndPaint, isDefaultSelected: false)
            ]
        )
    }
    
    private func terraceDeckingSection(from configuration: HouseConfiguration) -> OptionSection {
        let decking = configuration.terraceDeckingOptions
        
        return OptionSection(
            title: "Настил на террасах",
            selectionType: .single,
                        options: [
                OptionItem(id: "decking_1", title: "Террасная доска", deltaRub: decking.woodenDecking, isDefaultSelected: false),
                OptionItem(id: "decking_2", title: "Листовые материалы", deltaRub: decking.sheetMaterials, isDefaultSelected: false),
                OptionItem(id: "decking_3", title: "Террасная доска искусственная (ДПК)", deltaRub: decking.compositeDecking, isDefaultSelected: false)
            ]
        )
    }
    
    private func buildEngineeringSections() -> [EngineeringSection] {
        [
            EngineeringSection(
                title: "Отопление",
                selectionType: .multiple,
                            options: [
                    EngineeringItem(id: "h1", title: "Электрический котел", deltaRub: 85000, isDefaultSelected: false),
                    EngineeringItem(id: "h2", title: "Газовый котел", deltaRub: 120000, isDefaultSelected: false),
                    EngineeringItem(id: "h3", title: "Твердотопливный котел", deltaRub: 95000, isDefaultSelected: false),
                    EngineeringItem(id: "h4", title: "Тепловой насос", deltaRub: 350000, isDefaultSelected: false),
                    EngineeringItem(id: "h5", title: "Радиаторы отопления", deltaRub: 89000, isDefaultSelected: false),
                    EngineeringItem(id: "h6", title: "Теплый пол водяной", deltaRub: 145000, isDefaultSelected: false)
                ]
            ),
            EngineeringSection(
                title: "Водоснабжение",
                selectionType: .multiple,
                            options: [
                                EngineeringItem(id: "w1", title: "Скважина", deltaRub: 120000, isDefaultSelected: false),
                                EngineeringItem(id: "w2", title: "Насосная станция", deltaRub: 45000, isDefaultSelected: false),
                                EngineeringItem(id: "w3", title: "Фильтрация воды", deltaRub: 35000, isDefaultSelected: false),
                                EngineeringItem(id: "w4", title: "Водонагреватель", deltaRub: 55000, isDefaultSelected: false),
                                EngineeringItem(id: "w5", title: "Трубы ХВС", deltaRub: 67000, isDefaultSelected: false),
                                EngineeringItem(id: "w6", title: "Трубы ГВС", deltaRub: 67000, isDefaultSelected: false),
                                EngineeringItem(id: "w7", title: "Коллектор водоснабжения", deltaRub: 28000, isDefaultSelected: false)
                ]
            )
        ]
    }
    private func buildCharacteristicSections(from configuration: HouseConfiguration?) -> [CharacteristicSection] {
        guard let configuration else { return [] }
        
        let houseType = configuration.houseType
        
        return [
            // Характеристики 1 этажа
            CharacteristicSection(
                title: "1 этаж",
                options: [
                    CharacteristicItem(title: "Фундамент", value: houseType.foundation.rawValue),
                    CharacteristicItem(title: "Перекрытие", value: houseType.overlap.rawValue),
                    CharacteristicItem(title: "Внешние стены", value: houseType.exteriorWalls.rawValue),
                    CharacteristicItem(title: "Внутренние стены", value: houseType.internalWalls.rawValue)
                ]
            ),
            
            // Характеристики 2 этажа
            CharacteristicSection(
                title: "2 этаж",
                options: [
                    CharacteristicItem(title: "Перекрытие", value: houseType.overlapTwo.rawValue),
                    CharacteristicItem(title: "Внешние стены", value: houseType.exteriorWallsTwo.rawValue),
                    CharacteristicItem(title: "Внутренние стены", value: houseType.internalWallsTwo.rawValue)
                ]
            ),
            
            // Характеристики мансарды (3 этаж)
            CharacteristicSection(
                title: "Мансарда",
                options: [
                    CharacteristicItem(title: "Перекрытие", value: houseType.overlapThree.rawValue),
                    CharacteristicItem(title: "Внешние стены", value: houseType.exteriorWallsThree.rawValue),
                    CharacteristicItem(title: "Внутренние стены", value: houseType.internalWallsThree.rawValue)
                ]
            ),
            
            // Характеристики крыши
            CharacteristicSection(
                title: "Крыша",
                options: [
                    CharacteristicItem(title: "Материал кровли", value: houseType.roofMaterial.rawValue)
                ]
            )
        ]
    }
    }


