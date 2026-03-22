//
//  HouseProject.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.03.2026.
//


struct HouseProject {
    enum AreaRange: String {
        case fiftyMetres = "до 50 кв.м."
        case hundredMetres = "от 50 до 100 кв.м."
        case hundredFiftyMetres = "от 100 до 150 кв.м."
        case twoHundredMetres = "от 150 до 200 кв.м."
        case twoHundredFiftyMetres = "от 200 кв.м. и более"
        
        var name: String {
            switch self {
            case .fiftyMetres: ""
            case .hundredMetres: ""
            case .hundredFiftyMetres: ""
            case .twoHundredMetres: ""
            case .twoHundredFiftyMetres: ""
            }
        }
    }
    
    let named: String
    
    var house: [House]
}
