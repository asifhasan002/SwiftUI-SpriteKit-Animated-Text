//
//  ParticleEffect.swift
//  anim-test

import SpriteKit

enum ParticleEffect: Int, CaseIterable {
    case fireflies0, fireflies1, fireflies2, bokeh1, bokeh2, fire, magic, rain, smoke, snow, spark, spark0
    
    var particleSettings: (name: String, birthRate: CGFloat, size: CGSize) {
        switch self {
        case .fireflies0, .fireflies1:
            return (name: "fireflies", birthRate: 5000, size: CGSize(width: 20, height: 20))
        case .fireflies2:
            return (name: "fireflies", birthRate: 700, size: CGSize(width: 500, height: 5))
        case .bokeh1:
            return (name: "bokeh", birthRate: 500, size: CGSize(width: 500, height: 5))
        case .bokeh2:
            return (name: "bokeh", birthRate: 5000, size: CGSize(width: 5, height: 5))
        case .fire:
            return (name: "fire", birthRate: 0, size: CGSize(width: 20, height: 20))
        case .magic:
            return (name: "magic", birthRate: 10000, size: CGSize(width: 20, height: 5))
        case .rain:
            return (name: "rain", birthRate: 3000, size: CGSize(width: 10, height: 4000))
        case .smoke:
            return (name: "smoke", birthRate: 100, size: CGSize(width: 50, height: 5))
        case .snow:
            return (name: "snow", birthRate: 1000, size: CGSize(width: 10, height: 1300))
        case .spark, .spark0:
            return (name: "spark", birthRate: 0, size: CGSize(width: 35, height: 35))
        }
    }
}
