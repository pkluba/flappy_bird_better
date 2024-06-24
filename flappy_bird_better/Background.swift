//
//  Background.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 16/05/2024.
//

import UIKit
import SpriteKit

class Background: SKSpriteNode {
    
    init(imageName: String) {

        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        anchorPoint = CGPoint(x: 0, y: 0)
        zPosition = 0
        name = "background"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func scroll(_ duration:Double) -> SKAction{
        let scrollAction = SKAction.move(by: CGVector(dx: -size.width, dy: 0), duration: duration)
        return SKAction.repeatForever(scrollAction)
    }
}
