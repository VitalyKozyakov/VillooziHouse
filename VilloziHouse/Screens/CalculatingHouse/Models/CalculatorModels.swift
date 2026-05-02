//
//  CalculatorModels.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.04.2026.
//

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
struct EngineeringSection {
    let title: String
    let options: [EngineeringItem]
}
struct EngineeringItem {
    let id: String // индивид. номер(порядковый)
    let title: String // название в ячейке
    let deltaRub: Double //стоимость в ячейке
    let isDefaultSelected: Bool
}

struct OptionSection {
    enum Selection {
        case single // одна
        case multiple //несколько
    }
    
    let title: String // название секции
    let selectionType: Selection  // "single" или "multiple"
    let options: [OptionItem] // ячейки с названиями и ценами(два лейбла)
}

struct OptionItem {
    let id: String // индивид. номер(порядковый)
    let title: String // название в ячейке
    let deltaRub: Double //стоимость в ячейке
    let isDefaultSelected: Bool
}


enum CalculatorSection {
    case options(OptionSection)
    case characteristics(CharacteristicSection)
}

enum CalculatorTab: Int {
    case finishing
    case engineering
    case characteristics
    
    var title: String {
        switch self {
        case .finishing:
            return "Отделка"
        case .engineering:
            return "Инженерия"
        case .characteristics:
            return "Характеристики"
        }
    }
}
