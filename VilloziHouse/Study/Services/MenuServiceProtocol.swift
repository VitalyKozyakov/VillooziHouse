//
//  NetworkError.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 06.04.2026.
//


import Foundation

// MARK: - NetworkError

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(Int)
    case transportError(Error)
}

// MARK: - Protocol

protocol MenuServiceProtocol {
    func fetchMenu(completion: @escaping (Result<[MenuItem], NetworkError>) -> Void)
}

// MARK: - MockMenuService

final class MockMenuService: MenuServiceProtocol {

    func fetchMenu(completion: @escaping (Result<[MenuItem], NetworkError>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            guard let url = Bundle.main.url(forResource: "menu", withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                completion(.success(Self.fallbackMenu))
                return
            }
            do {
                let items = try JSONDecoder().decode([MenuItem].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
    }

    private static let fallbackMenu: [MenuItem] = [
        MenuItem(id: 1, title: "Капучино",   description: "Эспрессо с молочной пенкой",   price: 350, calories: 120, imageURL: "", isAvailable: true,  category: "Кофе"),
        MenuItem(id: 2, title: "Латте",      description: "Мягкий кофе с молоком",        price: 400, calories: 180, imageURL: "", isAvailable: true,  category: "Кофе"),
        MenuItem(id: 3, title: "Американо",  description: "Классический чёрный кофе",     price: 250, calories: 15,  imageURL: "", isAvailable: true,  category: "Кофе"),
        MenuItem(id: 4, title: "Флэт Уайт",  description: "Двойной эспрессо с молоком",   price: 380, calories: 140, imageURL: "", isAvailable: false, category: "Кофе"),
        MenuItem(id: 5, title: "Чизкейк",    description: "Нью-Йоркский чизкейк",         price: 450, calories: 520, imageURL: "", isAvailable: true,  category: "Десерты"),
        MenuItem(id: 6, title: "Круассан",   description: "Свежая выпечка с маслом",      price: 220, calories: 310, imageURL: "", isAvailable: true,  category: "Выпечка"),
        MenuItem(id: 7, title: "Тирамису",   description: "Итальянский десерт с кофе",    price: 480, calories: 430, imageURL: "", isAvailable: true,  category: "Десерты"),
        MenuItem(id: 8, title: "Апельсиновый сок", description: "Свежевыжатый",          price: 300, calories: 110, imageURL: "", isAvailable: true,  category: "Напитки"),
    ]
}
