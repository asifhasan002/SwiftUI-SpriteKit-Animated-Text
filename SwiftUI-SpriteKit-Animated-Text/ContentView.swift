//
//  ContentView.swift
//  SwiftUI-SpriteKit-Animated-Text

import SwiftUI

struct ContentView: View {
    private let effects = ParticleEffect.allCases
    private let colors = WordColorPair.allCases
    
    var body: some View {
        TabView {
            ForEach(effects.indices, id: \.self) { index in
                if let effect = effects[safe: index],
                   let wordColor = colors[safe: index] {
                    ParticleEffectRepresentable(effect: effect, wordColor: wordColor, index: index)
                        .edgesIgnoringSafeArea(.all)
                        .tabItem {
                            Text("Effect \(index + 1)")
                        }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
