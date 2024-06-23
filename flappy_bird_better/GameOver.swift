//
//  GameOver.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 23/06/2024.
//

import UIKit
import SpriteKit

class GameOver: SKScene {
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        let background:Background = Background(imageName: "background")
        
        background.size = CGSize(width: (background.texture!.size().width) * (size.height / background.texture!.size().height), height: size.height)
        
        background.position = CGPointZero
        
        background.zPosition = -100
        addChild(background)
        
        let dimPanel = SKSpriteNode(color: UIColor.black, size: size)
        dimPanel.alpha = 0.3
        dimPanel.zPosition = 0
        dimPanel.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(dimPanel)
        
        let overLabel: SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
        
        overLabel.position = CGPoint(x: size.width/2, y: size.height * 4/5)
        
        overLabel.fontSize = size.height / 7.0
        
        overLabel.horizontalAlignmentMode = .center
        
        overLabel.verticalAlignmentMode = .center
        
        let score = self.userData!["score"]
        
        overLabel.text = "Game Over! Score: \(score ?? "err")"
        
        overLabel.zPosition = 1
        
        addChild(overLabel)
        
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let touchLocation = touch?.location(in: self)
//        let touchedNode = self.atPoint(touchLocation!)
//        if(touchedNode.name == "startgame"){
//            startButt!.clicked = true
//            startButt!.press()
//            
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if startButt!.clicked {
//            startButt!.clicked = false
//            startButt!.unPress()
//            let gameScene = City()
//            gameScene.scaleMode = scaleMode
//            let transitionType = SKTransition.fade(withDuration: 1)
//            
//            view?.presentScene(gameScene,transition: transitionType)}
//    }

}

