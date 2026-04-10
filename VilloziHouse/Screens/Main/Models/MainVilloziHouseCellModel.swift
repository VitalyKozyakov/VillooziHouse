//
//  Untitled.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 27.03.2026.
//

enum MainVilloziHouseCellModel {
    case project
    case news
    case reviews
    case about
    case nedom
    case designing
    case mortgage
    case video
    case map
    case ownProduction
    case contacts

    case favourites
    case documents
    case progressOfWork
    case assignedPastMeetings

    var text: String {
        switch self {
        case .project: return "Проекты домов"
        case .news: return "Новости"
        case .reviews: return "Отзывы"
        case .about: return "О нас"
        case .nedom: return "Недом (комплектующие)"
        case .designing: return "Проектирование"
        case .mortgage: return "Ипотека"
        case .video: return "Видеонаблюдение (смотри за стройкой)"
        case .map: return "Карта построенных домов"
        case .ownProduction: return "Собственное производство"
        case .contacts: return "Контакты"
        case .favourites: return "Избранное"
        case .documents: return "Документы"
        case .progressOfWork: return "Ход работ"
        case .assignedPastMeetings: return "Назначенные/Прошедшие встречи"
        }
    }

    var icon: String? {
        switch self {
        case .project: return "✏️"
        case .news: return "📰"
        case .reviews: return "🫶"
        case .about: return "📜"
        case .nedom: return "🏰"
        case .designing: return "🏠"
        case .mortgage: return "💸"
        case .video: return "📽️"
        case .map: return "🌍"
        case .ownProduction: return "🏗️"
        case .contacts: return "☎️"
        case .favourites: return "✨"
        case .documents: return "📂"
        case .progressOfWork: return "⚒️"
        case .assignedPastMeetings: return "🫂"
        }
    }
}
