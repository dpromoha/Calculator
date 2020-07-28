//
//  Color.swift
//  calculator
//
//  Created by Daria Pr on 15.07.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

struct Color {
    var countColorTurn: Int = 0

    func changeColor(countColorTurn: Int) -> UIColor {
        switch countColorTurn {
        case 0:
            return #colorLiteral(red: 0.337254902, green: 0.3529411765, blue: 0.4588235294, alpha: 1)
        case 1:
            return #colorLiteral(red: 0.7960784314, green: 0.4980392157, blue: 0.02745098039, alpha: 1)
        case 2:
            return #colorLiteral(red: 0, green: 0.3215686275, blue: 0.2117647059, alpha: 1)
        case 3:
            return #colorLiteral(red: 0.7137254902, green: 0.5176470588, blue: 0.4196078431, alpha: 1)
        case 4:
            return #colorLiteral(red: 0.5176470588, green: 0.4784313725, blue: 0.6823529412, alpha: 1)
        case 5:
            return #colorLiteral(red: 0.6078431373, green: 0.2352941176, blue: 0.1803921569, alpha: 1)
        default:
            return #colorLiteral(red: 0.7296273112, green: 0.8755593896, blue: 0.9217910171, alpha: 1)
        }
    }
}
