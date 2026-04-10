//
//  Cart.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//


final class Cart {
    static let shared = Cart()
    private init() {}

    private(set) var items: [MenuItem] = []
    var onUpdated: (() -> Void)?

    var total: Int { items.reduce(0) { $0 + $1.price } }
    var count: Int { items.count }

    func add(_ item: MenuItem) {
        items.append(item)
        onUpdated?()
    }

    func remove(_ item: MenuItem) {
        if let i = items.lastIndex(where: { $0.id == item.id }) {
            items.remove(at: i)
        }
        onUpdated?()
    }

    func clear() {
        items.removeAll()
        onUpdated?()
    }

    func quantity(of item: MenuItem) -> Int {
        items.filter { $0.id == item.id }.count
    }
}
