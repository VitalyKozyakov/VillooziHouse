//
//  Extensions.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//

import Foundation

extension Int {
    func formattedAsPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        let number = formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        return number + " ₽"
    }
}

extension MenuItem {
    var calorieCategory: String {
        switch calories {
        case ..<100:    return "Лёгкое"
        case 100..<300: return "Среднее"
        default:        return "Калорийное"
        }
    }

    var shortDescription: String {
        "\(title) — \(price.formattedAsPrice()) · \(calories) ккал"
    }
}
