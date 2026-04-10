//
//  AreaRange.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 25.03.2026.
//

let areaRanges: [AreaRange] = AreaRange.allCases

enum AreaRange: String, CaseIterable {
    case extraSmall = "Очень мальенький"
    case small = "Малый"
    case medium = "Средний"
    case big = "Большой"
    case extraBig = "Очень большой"
    
    
    case fiftyMetres = "до 50 кв.м."
    case hundredMetres = "от 50 до 100 кв.м."
    case hundredFiftyMetres = "от 100 до 150 кв.м."
    case twoHundredMetres = "от 150 до 200 кв.м."
    case twoHundredFiftyMetres = "от 200 кв.м. и более"
    
//    var areaRange: AreaRange {
//        switch area {
//        case ..<50:
//            return .fiftyMetres
//        case 50..<100:
//            return .hundredMetres
//        case 100..<150:
//            return .hundredFiftyMetres
//        case 150..<200:
//            return .twoHundredMetres
//        default:
//            return .twoHundredFiftyMetres
//        }
//    }
    
    var description: String {
        switch self {
        case .extraSmall: return "до 50 кв.м."
        case .small: return "от 50 до 100 кв.м."
        case .medium: return "от 100 до 150 кв.м."
        case .big: return "от 150 до 200 кв.м."
        case .extraBig: return "от 200 кв.м. и более"
        default: return ""
        }
    }
    
    var squareMeters: Int {
        switch self {
            case .extraSmall: return 50
            case .small: return 100
            case .medium: return 150
            case .big: return 200
            case .extraBig: return 250
            
            case .fiftyMetres: return 50
            case .hundredMetres: return 100
            case .hundredFiftyMetres: return 150
            case .twoHundredMetres: return 200
            case .twoHundredFiftyMetres: return 200
        }
    }
    
//    var name: String {
//        switch self {
//        case .fiftyMetres: ""
//        case .hundredMetres: ""
//        case .hundredFiftyMetres: ""
//        case .twoHundredMetres: ""
//        case .twoHundredFiftyMetres: ""
//        }
//    }
}
