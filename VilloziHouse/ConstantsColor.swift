//
//  Constant.swift
//  VilloziHouse
//
//  Created by Виталий Козьяков on 23.02.2026.
//

import UIKit

enum ConstantsColor {
    
    static let colorText = UIColor(named: "#1A1A1A")
    static let colorBackground = UIColor(named: "#116466")
    static let colorBorder: UIColor = .white /*= UIColor(hex: "#FFCB9A")*/
    static let colorTextSelected = UIColor(named: "#FF0000")
    static let colorBackgroundSelected = UIColor(named: "#FF0000")
    static let colorBorderSelected = UIColor(named: "#FF0000")
    static let colorBackgroundLabel = UIColor(named: "#D9B08C")
    static let colorTextField = UIColor.systemGray6
    static let colorLoadingIndicator = UIColor(named: "#FFCB9A")
    static let colorError: UIColor = .red
    static let colorButton = UIColor(named: "#14bdff")
    static let villoziGreen = UIColor(named: "#4CAF50")
    
//    static let villoziDarkText = UIColor(named: "#1A1A1A")
//        static let villoziBackground = UIColor.white
//        static let villoziAccentOrange = UIColor(named: "#F26522")
//        static let villoziLightGray = UIColor(named: "#F5F5F5")
//        static let villoziGold = UIColor(named: "#FFD700")
//        static let villoziGreen = UIColor(named: "#4CAF50")
    
    enum ApplicationVC {
        
        static let colorText = ConstantsColor.colorText
        static let colorBackground = ConstantsColor.colorBackground
        static let colorBorder = ConstantsColor.colorBorder
        static let colorTextSelected = ConstantsColor.colorTextSelected
        static let colorBackgroundSelected = ConstantsColor.colorBackgroundSelected
        static let colorBorderSelected = ConstantsColor.colorBorderSelected
        static let colorBackgroundLabel = ConstantsColor.colorBackgroundLabel
        static let colorTextField = ConstantsColor.colorTextField
        static let colorLoadingIndicator = ConstantsColor.colorLoadingIndicator
        static let colorButton = ConstantsColor.colorButton
        static let villoziGreen = ConstantsColor.villoziGreen
    }
}
