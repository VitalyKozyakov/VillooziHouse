//
//  CatalogOfHousesDataSourse.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 19.03.2026.
//

import UIKit

class CatalogOfHousesDataSourse {
    
    private var houses: [HouseProject] = [
        HouseProject(
            id: "",
            named: "Проекты до 50 кв.м.",
            house: [
                House(id: "01-18", name: "VH 01-18 Форио", dimensions: "6,28 x 8,045", area: 43, bedrooms: 2, price: 1060496, imageProject: "01-18-1", imageGallery: ["01-18-1","01-18-2","01-18-3","01-18-4","01-18-5","01-18-6", "01-18-7","01-18-8"], isFavorite: false),
                House(id: "08-19", name: "VH 08-19 Барн Эрих", dimensions: "5 x 3", area: 30, bedrooms: 1, price: 528071, imageProject: "08-19-1", imageGallery: ["08-19-1","08-19-2","08-19-3","08-19-4","08-19-5","08-19-6", "08-19-7","08-19-8"], isFavorite: false),
                House(id: "73-24", name: "VH 73-24 Баня Форрест Гамп", dimensions: "3,1 x 10.55", area: 23, bedrooms: 0, price: 823355, imageProject: "73-24-1", imageGallery: ["73-24-1","73-24-2","73-24-3","73-24-4","73-24-5","73-24-6", "73-24-7","73-24-8"], isFavorite: false),
                House(id: "54-12", name: "VH 54-12 Баня", dimensions: "5.2 x 5.7", area: 30, bedrooms: 0, price: 796308, imageProject: "-1", imageGallery: ["54-12-1","54-12-2","54-12-3","54-12-4","54-12-5","54-12-6", "54-12-7","54-12-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
                House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            ]
        ),
        
        HouseProject(id: "", named: "Проекты от 50 до 100 кв.м.", house: [
            
            House(id: "60-23", name: "60-23 Виллози-дом приз в ДОМ.РФ", dimensions: "7.6 x 7.6", area: 57.0, bedrooms: 2, price: 1073611, imageProject: "project6023",isFavorite: false),
            House(id: "02-24", name: "02-24 Виллози-дом с террасой", dimensions: "8.9м x 7.6м", area: 63, bedrooms: 2, price: 1508611, imageProject: "project0224",isFavorite: false),
            House(id: "53-25", name: "53-25 Виллози-дом Отражение", dimensions: "8.9м x 7.5м", area: 63, bedrooms: 2, price: 1387025, imageProject: "project5325",isFavorite: false),
            House(id: "73-22", name: "73-22 Барнхаус Фурше", dimensions: "7.6м x 7.6м", area: 57, bedrooms: 2, price: 1077917, imageProject: "project7322",isFavorite: false),
            House(id: "117-22", name: "117-22 Хюгге 70 + лофт 10 м²", dimensions: "10.2м x 7.5м", area: 83, bedrooms: 2, price: 1526933, imageProject: "project11722",isFavorite: false),
            House(id: "Колхозный дом", name: "Колхозный дом", dimensions: "10.9м x 9м", area: 97, bedrooms: 3, price: 1937442, imageProject: "",isFavorite: false),
            House(id: "24-24", name: "24-24",dimensions: "7.6м x 7.6м",area: 57,bedrooms: 2,price: 1249503,imageProject: "project2424",isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
        ]),
        HouseProject(id: "", named: "Проекты от 100-150 кв.м.", house: [
            House(id: "01-24", name: "01-24 Хюгге 90 + лофт 13 м²", dimensions: "10м x 9м", area: 105, bedrooms: 3, price: 2123665, imageProject: "project0124",isFavorite: false),
            House(id: "04-21", name: "04-21 Хюгге 122", dimensions: "13.9м x 8.8м", area: 122, bedrooms: 4, price: 2354881, imageProject: "project0421",isFavorite: false),
            House(id: "127-14", name: "127-14 НЕО", dimensions: "7 x 8", area: 112.0, bedrooms: 3, price: 1200000, imageProject: "project127-14-0", imageGallery: ["project127-14-0", "project127-14-01", "project127-14-3", "project127-14-4", "project127-14-5", "project127-14-6", "project127-14-1", "project127-14-2"],isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "157-20", name: "157-20 Канильон", dimensions: "8.4м x 8.2м", area: 137, bedrooms: 3, price: 1783407, imageProject: "project15720",isFavorite: false)
        ]),
        HouseProject(id: "", named: "Проекты от 150-200 кв.м.", house: [
            House(id: "124-14", name: "124-14", dimensions: "10m x 8m", area: 160, bedrooms: 4, price: 10000000, imageProject: "project12414", isFavorite: false),
            House(id: "87-13", name: "VH 87-13 Рислинг", dimensions: "10.55 x 10.50", area: 188, bedrooms: 4, price: 8713000, imageProject: "87-13-1", imageGallery: ["87-13-1","87-13-2","87-13-3","87-13-4","87-13-5","87-13-6"], isFavorite: false),
            House(id: "45-16", name: "VH 45-16 Валанс", dimensions: "10.55 x 10.50", area: 196, bedrooms: 4, price: 2214503, imageProject: "45-16-1", imageGallery: ["45-16-1","45-16-2","45-16-3","45-16-4","45-16-5","45-16-6", "45-16-7","45-16-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
        ]),
        HouseProject(id: "", named: "Проекты от 200 кв.м.", house: [
            
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            
            House(id: "24-16", name: "VH 24-16 Бернар", dimensions: "14.4 x 12.5", area: 249, bedrooms: 4, price: 4383156, imageProject: "24-16-1", imageGallery: ["24-16-1","24-16-2","24-16-3","24-16-4","24-16-5","24-16-6","24-16-7","24-16-8"], isFavorite: false),
            House(id: "104-13", name: "VH 104-13 Элькат", dimensions: " x ", area: 214, bedrooms: 4, price: 4487600, imageProject: "104-13-1", imageGallery: ["104-13-1","104-13-2","104-13-3","104-13-4","104-13-5","104-13-6", "104-13-7","104-13-8"], isFavorite: false),
            House(id: "61-16", name: "VH 61-16", dimensions: " x ", area: 230, bedrooms: 4, price: 3333155, imageProject: "61-16-1", imageGallery: ["61-16-1","61-16-2","61-16-3","61-16-4","61-16-5","61-16-6", "61-16-7","61-16-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "", name: "VH СКОРО ТУТ БУДЕТ НОВЫЙ ПРОЕКТ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false),
            House(id: "51-15", name: "VH 51-15", dimensions: "18.024 x 17.296", area: 352, bedrooms: 4, price: 5046734, imageProject: "51-15-1", imageGallery: ["51-15-1","51-15-2","51-15-3","51-15-4","51-15-5","51-15-6", "51-15-7","51-15-8"], isFavorite: false)
        ])
    ]
    
    init() {}
    
    func getHouse() -> [HouseProject] {
        houses
    }
    
    func saveHouses(_ houses: [HouseProject]) {
        self.houses = houses
    }
}
//House(id: "", name: "VH ", dimensions: " x ", area: 0, bedrooms: 0, price: 0, imageProject: "-1", imageGallery: ["-1","-2","-3","-4","-5","-6", "-7","-8"], isFavorite: false)
