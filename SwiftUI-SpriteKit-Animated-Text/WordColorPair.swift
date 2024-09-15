//
//  WordColorPair.swift
//  anim-test

import UIKit

enum WordColorPair: Int, CaseIterable {
    case word0, word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11
    
    var wordAndColor: (word: String, color: UIColor) {
        switch self {
        case .word0, .word1:
            return ("PLAY", UIColor.orange)
        case .word2:
            return ("PUSH", UIColor.green)
        case .word3:
            return ("KITE", UIColor.yellow)
        case .word4:
            return ("MAKE", UIColor.red)
        case .word5:
            return ("FIRE", UIColor(red: 1.0, green: 0.3, blue: 0.0, alpha: 1.0))
        case .word6:
            return ("MINT", UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0))
        case .word7:
            return ("BOLD", UIColor.blue.brighten(by: 0.3))
        case .word8:
            return ("GLOW", UIColor.magenta)
        case .word9:
            return ("WAVE", UIColor.magenta)
        case .word10, .word11:
            return ("FIZZ", UIColor.brown)
        }
    }
}
