//
//  UIColor+Extensions.swift
//  anim-test

import UIKit

extension UIColor {
    func brighten(by percentage: CGFloat) -> UIColor {
        let clampedPercentage = max(0, min(percentage, 1))
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(
            red: red + (1 - red) * clampedPercentage,
            green: green + (1 - green) * clampedPercentage,
            blue: blue + (1 - blue) * clampedPercentage,
            alpha: alpha
        )
    }
}
