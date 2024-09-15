//
//  ParticleEffectScene.swift
//  anim-test

import SpriteKit

class ParticleEffectScene: SKScene {
    var effect: ParticleEffect = .fireflies1
    var wordColor: WordColorPair = .word2
    var index: Int = 0
    
    override func didMove(to view: SKView) {
        print(index)
        
        if index == 0 {
            addNodes(texts: "MASK", wordColors: [.word1, .word3, .word2, .word4], effects: [.fireflies1, .bokeh1, .fireflies2, .bokeh2])
        } else if index == 11 {
            addNodes(texts: "MASK", wordColors: [.word5, .word6, .word8, .word9], effects: [.fire, .magic, .smoke, .snow])
        } else {
            addNodes(wordColor: wordColor, effect: effect)
        }
    }
    
    private func addNodes(texts: String, wordColors: [WordColorPair], effects: [ParticleEffect]) {
        setupScene()
        
        let fontSize: CGFloat = 48
        let spacing: CGFloat = 38
        let totalWidth: CGFloat = CGFloat(texts.count - 1) * spacing + fontSize
        let startX = frame.midX - totalWidth / 2 + fontSize / 2
        
        for (i, character) in texts.enumerated() {
            let cropNode = createCropNode(at: startX + CGFloat(i) * spacing, with: character, fontSize: fontSize)
            let nodeToMask = createEmitterNode(for: effects[i], color: wordColors[i].wordAndColor.color)
            cropNode.addChild(nodeToMask)
            addChild(cropNode)
        }
    }
    
    private func addNodes(wordColor: WordColorPair, effect: ParticleEffect) {
        setupScene()
        
        let texts = wordColor.wordAndColor.word
        let fontSize: CGFloat = 48
        let spacing: CGFloat = 38
        let totalWidth: CGFloat = CGFloat(texts.count - 1) * spacing + fontSize
        let startX = frame.midX - totalWidth / 2 + fontSize / 2
        
        for (i, character) in texts.enumerated() {
            let cropNode = createCropNode(at: startX + CGFloat(i) * spacing, with: character, fontSize: fontSize)
            let nodeToMask = createEmitterNode(for: effect, color: wordColor.wordAndColor.color)
            cropNode.addChild(nodeToMask)
            addChild(cropNode)
        }
    }
    
    private func setupScene() {
        backgroundColor = .black
    }
    
    private func createCropNode(at position: CGFloat, with character: Character, fontSize: CGFloat) -> SKCropNode {
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: position, y: frame.midY)
        cropNode.zPosition = 1
        
        let mask = SKLabelNode(fontNamed: "ArialMT")
        mask.text = String(character)
        mask.fontColor = .green
        mask.fontSize = fontSize
        cropNode.maskNode = mask
        
        return cropNode
    }
    
    private func createEmitterNode(for effect: ParticleEffect, color: UIColor) -> SKEmitterNode {
        let nodeToMask = SKEmitterNode(fileNamed: effect.particleSettings.name)!
        
        if effect != .fire && effect != .spark {
            nodeToMask.particleBirthRate = effect.particleSettings.birthRate
            nodeToMask.numParticlesToEmit = 0
        }
        
        nodeToMask.particleLifetime = 10
        nodeToMask.particleAlpha = 1.0
        nodeToMask.particleColor = color
        nodeToMask.particleColorBlendFactor = 1.0
        nodeToMask.particleSize = effect.particleSettings.size
        nodeToMask.position = .zero
        nodeToMask.name = "character"
        
        return nodeToMask
    }
}
