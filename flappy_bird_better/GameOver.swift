//
//  GameOver.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 23/06/2024.
//

import UIKit
import SpriteKit

class GameOver: SKScene {
    
    var againButton:CustomButton?
    var backButton:CustomButton?
    
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
        againButton = CustomButton(position: CGPoint(x: self.size.width/4, y: self.size.height * 2/5), height: self.size.height * 1/5, childNames: "startagain", text: "Retry")

       backButton = CustomButton(position: CGPoint(x: self.size.width * 3/5, y: self.size.height * 2/5), height: self.size.height * 1/5, childNames: "backmenu", text: "Back to menu")
        
        addChild(againButton!)
        addChild(backButton!)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch?.location(in: self)
        let touchedNode = self.atPoint(touchLocation!)
        if(touchedNode.name == "startagain"){
            againButton!.clicked = true
            againButton!.press()
        }
        if(touchedNode.name == "backmenu"){
            backButton!.clicked = true
            backButton!.press()
        }
    }
  
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if againButton!.clicked {
            againButton!.clicked = false
            againButton!.unPress()
            let gameScene = City()
            gameScene.scaleMode = scaleMode
            let transitionType = SKTransition.crossFade(withDuration: 3)
            
            view?.presentScene(gameScene,transition: transitionType)}
        
        if backButton!.clicked {
            backButton!.clicked = false
            backButton!.unPress()
            let gameScene = NewGameScene()
            gameScene.scaleMode = scaleMode
            let transitionType = SKTransition.fade(withDuration: 2)
            
            view?.presentScene(gameScene,transition: transitionType)}
    }

}

