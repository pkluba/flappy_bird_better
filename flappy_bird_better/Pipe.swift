//
//  Pipe.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 22/06/2024.
//

import UIKit
import SpriteKit

class Pipe: SKSpriteNode {
    init(imageName: String, orientation: String, ending: Double) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        setScale(0.25)
    
        if (orientation == "down") {
            position = CGPoint(x: 0, y: ending + size.height / 2)
        }
        else if (orientation == "up") {
            position = CGPoint(x: 0, y: ending - size.height / 2)
        }
        
        physicsBody = SKPhysicsBody(rectangleOf: size)

        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.categoryBitMask = Collision.Pipe

        physicsBody?.collisionBitMask = 0x0
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animation (_ scene_start: Double, _ duration: Double) -> SKAction {
        position = CGPoint(x: scene_start + self.size.width, y: position.y)
        let bypass = SKAction.move(to: CGPoint(x: -size.width, y: position.y), duration: duration)
        return bypass
    }
    
}
