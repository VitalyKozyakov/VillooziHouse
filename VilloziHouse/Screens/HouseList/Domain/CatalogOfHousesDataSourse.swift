//
//  CatalogOfHousesDataSourse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

class CatalogOfHousesDataSourse {
    
    init() {}
    
    func getHouse() -> [HouseProject] {
        [
            HouseProject(
                id: "",
                named: "Проекты до 50 кв.м.",
                house: [
                    House(
                        id: "127-14", name: "127-14 НЕО", dimensions: "7 x 8", area: 112.0, bedrooms: 3, price: 1200000, imageProject: "project127-14-0", imageGallery: ["project127-14-0", "project127-14-01", "project127-14-3", "project127-14-4", "project127-14-5", "project127-14-6", "project127-14-1", "project127-14-2"]
                    ),House(
                        id: "60-23", name: "60-23 Виллози-дом приз в ДОМ.РФ", dimensions: "7.6 x 7.6", area: 57.0, bedrooms: 2, price: 1073611, imageProject: "project6023", imageGallery: ["project6023", "project0124", "project0224", "manager1"]
                    ),
                    House(id: "01-24", name: "01-24 Хюгге 90 + лофт 13 м²",dimensions: "10м x 9м",area: 105,bedrooms: 3,price: 2123665,imageProject: "project0124"),
                    House(id: "02-24", name: "02-24 Виллози-дом с террасой",dimensions: "8.9м x 7.6м",area: 63,bedrooms: 2,price: 1508611,imageProject: "project0224"),
                    House(id: "53-25", name: "53-25 Виллози-дом Отражение",dimensions: "8.9м x 7.5м",area: 63,bedrooms: 2,price: 1387025,imageProject: "project5325"),
                    House(id: "Колхозный дом", name: "Колхозный дом",dimensions: "10.9м x 9м",area: 97,bedrooms: 3, price: 1937442,imageProject: ""),
                    House(id: "04-21", name: "04-21 Хюгге 122",dimensions: "13.9м x 8.8м",area: 122,bedrooms: 4,price: 2354881,imageProject: "project0421"),
                    House(id: "73-22", name: "73-22 Барнхаус Фурше",dimensions: "7.6м x 7.6м",area: 57,bedrooms: 2,price: 1077917, imageProject: "project7322"),
                    House(id: "157-20", name: "157-20 Канильон",dimensions: "8.4м x 8.2м",area: 137,bedrooms: 3,price: 1783407,imageProject: "project15720"),
                    House(id: "117-22", name: "117-22 Хюгге 70 + лофт 10 м²",dimensions: "10.2м x 7.5м",area: 83,bedrooms: 2,price: 1526933,imageProject: "project11722"),
                    House(id: "24-24", name: "24-24",dimensions: "7.6м x 7.6м",area: 57,bedrooms: 2,price: 1249503,imageProject: "project2424"),
                    House(id: "124-14", name: "124-14",dimensions: "10m x 8m",area: 160,bedrooms: 4,price: 10000000,imageProject: "project12414",isFavorite: true)
                ]
            ),
            
            HouseProject(id: "", named: "Проекты от 50 до 100 кв.м.", house: [
                House(id: "60-23", name: "60-23 Виллози-дом приз в ДОМ.РФ", dimensions: "7.6 x 7.6", area: 57.0, bedrooms: 2, price: 1073611, imageProject: "project6023"),
                House(id: "02-24", name: "02-24 Виллози-дом с террасой", dimensions: "8.9м x 7.6м", area: 63, bedrooms: 2, price: 1508611, imageProject: "project0224"),
                House(id: "53-25", name: "53-25 Виллози-дом Отражение", dimensions: "8.9м x 7.5м", area: 63, bedrooms: 2, price: 1387025, imageProject: "project5325"),
                House(id: "73-22", name: "73-22 Барнхаус Фурше", dimensions: "7.6м x 7.6м", area: 57, bedrooms: 2, price: 1077917, imageProject: "project7322"),
                House(id: "117-22", name: "117-22 Хюгге 70 + лофт 10 м²", dimensions: "10.2м x 7.5м", area: 83, bedrooms: 2, price: 1526933, imageProject: "project11722"),
                House(id: "24-24", name: "24-24", dimensions: "7.6м x 7.6м", area: 57, bedrooms: 2, price: 1249503, imageProject: "project2424")
            ]),
            HouseProject(id: "", named: "Проекты от 100-150 кв.м.", house: [
                House(id: "01-24", name: "01-24 Хюгге 90 + лофт 13 м²", dimensions: "10м x 9м", area: 105, bedrooms: 3, price: 2123665, imageProject: "project0124"),
                House(id: "Колхозный дом", name: "Колхозный дом", dimensions: "10.9м x 9м", area: 97, bedrooms: 3, price: 1937442, imageProject: ""),
                House(id: "04-21", name: "04-21 Хюгге 122", dimensions: "13.9м x 8.8м", area: 122, bedrooms: 4, price: 2354881, imageProject: "project0421"),
                House(id: "157-20", name: "157-20 Канильон", dimensions: "8.4м x 8.2м", area: 137, bedrooms: 3, price: 1783407, imageProject: "project15720")
            ]),
            HouseProject(id: "", named: "Проекты от 150-200 кв.м.", house: [
                House(id: "124-14", name: "124-14", dimensions: "10m x 8m", area: 160, bedrooms: 4, price: 10000000, imageProject: "project12414", isFavorite: true)
            ]),
            HouseProject(id: "", named: "Проекты от 200 кв.м.", house: [
                
            ])
        ]
    }
}
