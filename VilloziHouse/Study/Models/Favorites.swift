//
//  Favorites.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//


class Favorites {
    var items: [House] = []

    func add(_ house: House) {
        items.append(house)
    }

    func remove(at index: Int) {
        items.remove(at: index)
    }

    // Вычисляемое свойство — не хранит значение, вычисляет каждый раз
    var count: Int {
        return items.count
    }

    func contains(_ house: House) -> Bool {
        return items.contains(where: { $0.id == house.id })
    }
}