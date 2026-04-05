//
//  MenuItem.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//


// MARK: - MenuItem (модель для списка меню)

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let calories: Int
    let imageURL: String
    let isAvailable: Bool
    let category: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, price, calories, category
        case imageURL    = "image_url"
        case isAvailable = "is_available"
    }
}
