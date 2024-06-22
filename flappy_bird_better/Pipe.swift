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
        
        if (orientation == "down") {
            zRotation = Double.pi
            anchorPoint = CGPoint(x: 1, y: 1)
        }
        else if (orientation == "up") {
            zRotation = 0
            anchorPoint = CGPoint(x: 0, y: 1)

        }
        
        position = CGPoint(x: 0, y: ending)
        
        setScale(0.25)
        
        
        zPosition = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animation (_ scene_start: Double, _ duration: Double) -> SKAction {
        position = CGPoint(x: scene_start, y: position.y)
        let bypass = SKAction.move(to: CGPoint(x: -size.width, y: position.y), duration: duration)
        return bypass
    }
    
}
