//
//  File.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 23/06/2024.
//

import UIKit
import SpriteKit

class CustomButton: SKNode {
    
    let startGameLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    let startGameBody:SKShapeNode
    
    let initPosition:CGPoint
    
    var clicked: Bool = false
    
    init(position: CGPoint, height: Double, childNames: String, text: String) {
        initPosition = position
        
        startGameLabel.horizontalAlignmentMode = .center
        
        startGameLabel.verticalAlignmentMode = .center
        
        startGameLabel.fontSize = height * 0.5
        startGameLabel.position = position
        startGameLabel.text = text
        
        startGameBody = SKShapeNode(rect: CGRect(origin: CGPoint(x:-startGameLabel.frame.width * 0.6,y: -height/2), size: CGSize(width: startGameLabel.frame.width * 1.2, height: height)), cornerRadius: height / 4)
        
        startGameBody.name = childNames
        startGameLabel.name = childNames
        startGameBody.fillColor = SKColor.systemPurple
        
        startGameBody.position = position
        
        super.init()
        
        startGameBody.zPosition = 0
        startGameLabel.zPosition = 1
        addChild(startGameBody)
        addChild(startGameLabel)
        self.zPosition = 1
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func press() {
        startGameLabel.setScale(0.85)
        startGameBody.setScale(0.85)
        startGameLabel.position = initPosition
    }
    
    func unPress() {
        startGameLabel.setScale(1)
        startGameBody.setScale(1)
        startGameLabel.position = initPosition
    }


}

