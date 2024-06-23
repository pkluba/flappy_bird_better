//
//  Birdie.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 21/06/2024.
//

import UIKit
import SpriteKit

class Birdie: SKSpriteNode {
    init(imageName: String, height: Double) {
        let texture = SKTexture(imageNamed: imageName)
        
        let scale = height / texture.size().height
        
        super.init(texture: texture, color: SKColor.clear, size: CGSize(width: texture.size().width * scale, height: texture.size().height * scale))
        
        physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        
//        physicsBody = SKPhysicsBody(circleOfRadius: size.height / 3.0)
        
        
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.categoryBitMask = Collision.Birdie
        physicsBody?.contactTestBitMask = Collision.Pipe | Collision.Border
        physicsBody?.collisionBitMask = 0x0
        
        
        
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
