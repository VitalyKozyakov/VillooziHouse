//
//  CatalogOfHousesDataSourse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

 class CatalogOfHousesDataSourse {
       
    init() {
        
    }
    
    struct HouseProject {
        enum areaRange: String {
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
        
        init(named: String, house: [House]) {
            self.named = named
            self.house = house
        }
    }
    struct House {
        let name: String
        let dimensions: String
        let area: Double
        let bedrooms: Int
        let price: Double
        let imageProject: String?
        var isFavorite: Bool = false
        
        var areaRange: HouseProject.areaRange {
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

    func getHouse() -> [HouseProject] {
        [
            HouseProject(named: "Проекты до 50 кв.м.",house: [
                House(name: "60-23 Виллози-дом приз в ДОМ.РФ",dimensions: "7.6 x 7.6",area: 57.0,bedrooms: 2,price: 1073611,imageProject: "project6023"),
                House(name: "01-24 Хюгге 90 + лофт 13 м²",dimensions: "10м x 9м",area: 105,bedrooms: 3,price: 2123665,imageProject: "project0124"),
                House(name: "02-24 Виллози-дом с террасой",dimensions: "8.9м x 7.6м",area: 63,bedrooms: 2,price: 1508611,imageProject: "project0224"),
                House(name: "53-25 Виллози-дом Отражение",dimensions: "8.9м x 7.5м",area: 63,bedrooms: 2,price: 1387025,imageProject: "project5325"),
                House(name: "Колхозный дом",dimensions: "10.9м x 9м",area: 97,bedrooms: 3, price: 1937442,imageProject: ""),
                House(name: "04-21 Хюгге 122",dimensions: "13.9м x 8.8м",area: 122,bedrooms: 4,price: 2354881,imageProject: "project0421"),
                House(name: "73-22 Барнхаус Фурше",dimensions: "7.6м x 7.6м",area: 57,bedrooms: 2,price: 1077917, imageProject: "project7322"),
                House(name: "157-20 Канильон",dimensions: "8.4м x 8.2м",area: 137,bedrooms: 3,price: 1783407,imageProject: "project15720"),
                House(name: "117-22 Хюгге 70 + лофт 10 м²",dimensions: "10.2м x 7.5м",area: 83,bedrooms: 2,price: 1526933,imageProject: "project11722"),
                House(name: "24-24",dimensions: "7.6м x 7.6м",area: 57,bedrooms: 2,price: 1249503,imageProject: "project2424"),
                House(name: "124-14",dimensions: "10m x 8m",area: 160,bedrooms: 4,price: 10000000,imageProject: "project12414",isFavorite: true)
            ]),
            
            HouseProject(named: "Проекты от 50 до 100 кв.м.", house: [
                House(name: "60-23 Виллози-дом приз в ДОМ.РФ", dimensions: "7.6 x 7.6", area: 57.0, bedrooms: 2, price: 1073611, imageProject: "project6023"),
                House(name: "02-24 Виллози-дом с террасой", dimensions: "8.9м x 7.6м", area: 63, bedrooms: 2, price: 1508611, imageProject: "project0224"),
                House(name: "53-25 Виллози-дом Отражение", dimensions: "8.9м x 7.5м", area: 63, bedrooms: 2, price: 1387025, imageProject: "project5325"),
                House(name: "73-22 Барнхаус Фурше", dimensions: "7.6м x 7.6м", area: 57, bedrooms: 2, price: 1077917, imageProject: "project7322"),
                House(name: "117-22 Хюгге 70 + лофт 10 м²", dimensions: "10.2м x 7.5м", area: 83, bedrooms: 2, price: 1526933, imageProject: "project11722"),
                House(name: "24-24", dimensions: "7.6м x 7.6м", area: 57, bedrooms: 2, price: 1249503, imageProject: "project2424")
            ]),
            HouseProject(named: "Проекты от 100-150 кв.м.", house: [
                House(name: "01-24 Хюгге 90 + лофт 13 м²", dimensions: "10м x 9м", area: 105, bedrooms: 3, price: 2123665, imageProject: "project0124"),
                House(name: "Колхозный дом", dimensions: "10.9м x 9м", area: 97, bedrooms: 3, price: 1937442, imageProject: ""),
                House(name: "04-21 Хюгге 122", dimensions: "13.9м x 8.8м", area: 122, bedrooms: 4, price: 2354881, imageProject: "project0421"),
                House(name: "157-20 Канильон", dimensions: "8.4м x 8.2м", area: 137, bedrooms: 3, price: 1783407, imageProject: "project15720")
            ]),
            HouseProject(named: "Проекты от 150-200 кв.м.", house: [
                House(name: "124-14", dimensions: "10m x 8m", area: 160, bedrooms: 4, price: 10000000, imageProject: "project12414", isFavorite: true)
            ]),
            HouseProject(named: "Проекты от 200 кв.м.", house: [
                
            ])
        ]
    }
 }
