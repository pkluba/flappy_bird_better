//
//  Birdie.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 21/06/2024.
//

import UIKit
import SpriteKit

class Birdie: SKSpriteNode {
    init(imageName: String, scale: Double) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: SKColor.clear, size: CGSize(width: texture.size().width * scale, height: texture.size().height * scale))
        
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        
        physicsBody?.affectedByGravity = false
        
        
        
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func start() {
        physicsBody?.affectedByGravity = true
    }
    
    func jump(_ intensity: Int)  {
        physicsBody?.velocity = CGVector(dx: 0, dy: intensity)
    }
}
