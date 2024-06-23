//
//  NewGameScene.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 23/06/2024.
//


import UIKit
import SpriteKit

class NewGameScene: SKScene {

    var buttClicked:Bool = false
    var startButt:StartGameButton?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        startButt = StartGameButton(position: CGPoint(x: size.width/2, y: size.height/2), height: size.height/3)
        
        startButt!.name = "startgame"
        let background:Background = Background(imageName: "background")
        background.size = CGSize(width: (background.texture!.size().width) * (size.height / background.texture!.size().height), height: size.height)
        
        background.position = CGPointZero
        
        background.zPosition = -100
        startButt!.zPosition = 1
        addChild(background)
        addChild(startButt!)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch?.location(in: self)
        let touchedNode = self.atPoint(touchLocation!)
        if(touchedNode.name == "startgame"){
            buttClicked = true
            startButt?.press()
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if buttClicked {
            buttClicked = false
            let gameScene = City()
            gameScene.scaleMode = scaleMode
            let transitionType = SKTransition.fade(withDuration: 1)
            
            view?.presentScene(gameScene,transition: transitionType)}
        
        buttClicked = false
        startButt?.unPress()
    }

}
