//
//  House.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 22.03.2026.
//

import Foundation

struct House {
    let name: String
    let dimensions: String
    let area: Double
    let bedrooms: Int
    let price: Double
    let imageProject: String?
    var isFavorite: Bool = false
    
    var areaRange: HouseProject.AreaRange {
        switch area {
        case ..<50:
            return .fiftyMetres
        case 50..<100:
            return .hundredMetres
        case 100..<150:
            return .hundredFiftyMetres
        case 150..<200:
            return .twoHundredMetres
        default:
            return .twoHundredFiftyMetres
        }
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: price)) ?? "от \(price) ₽"
    }
    
    var formattedArea: String {
        return String(format: "%.1f", area)
    }
    
    var formattedRooms: String {
        return "\(bedrooms) комнат"
    }
}
