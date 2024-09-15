//
//  ParticleEffectRepresentable.swift
//  SwiftUI-SpriteKit-Animated-Text

import SwiftUI
import SpriteKit

struct ParticleEffectRepresentable: UIViewRepresentable {
    let effect: ParticleEffect
    let wordColor: WordColorPair
    let index: Int
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        skView.presentScene(createScene())
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        uiView.presentScene(createScene())
    }
    
    private func createScene() -> SKScene {
        let scene = ParticleEffectScene(size: CGSize(width: 400, height: 400))
        scene.effect = effect
        scene.wordColor = wordColor
        scene.index = index
        scene.scaleMode = .aspectFill
        return scene
    }
}
