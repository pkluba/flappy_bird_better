//
//  City.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 16/05/2024.
//

import UIKit
import SpriteKit

class City: SKScene, SKPhysicsContactDelegate {
    
    let gameBackground1:Background = Background(imageName: "background")
    let gameBackground2:Background = Background(imageName: "background")
    
    let birdie:Birdie = Birdie(imageName: "bird", scale: 0.05)
    
    var firstTouch: Bool = true
    var nextPipes: Bool = false
    var pipeInterval: Double = 2.0
    var lastMiddle: Double
    
    
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        gameBackground1.size = CGSize(width: (gameBackground1.texture!.size().width) * (size.height / gameBackground1.texture!.size().height), height: size.height)
        gameBackground2.size = CGSize(width: (gameBackground2.texture!.size().width) * (size.height / gameBackground2.texture!.size().height), height: size.height)
        gameBackground1.position = CGPoint(x: 0, y: 0)
        gameBackground2.position = CGPoint(x: gameBackground1.size.width, y: 0)
        birdie.position = CGPoint(x: size.width / 8, y: size.height/2)
        addChild(gameBackground1)
        addChild(gameBackground2)
        addChild(birdie)
        gameBackground1.run(gameBackground1.scroll(3))
        gameBackground2.run(gameBackground2.scroll(3))
        lastMiddle = size.height / 2.0
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (gameBackground1.position.x < -gameBackground1.size.width) {
            gameBackground1.position = CGPoint(x: (gameBackground2.position.x + gameBackground1.size.width), y: 0)
        }
        if (gameBackground2.position.x < -gameBackground2.size.width) {
            gameBackground2.position = CGPoint(x: (gameBackground1.position.x + gameBackground2.size.width), y: 0)
        }
        if (nextPipes) {
            
            let pset = PipeSet(middle: size.height / 2.0, gap: size.height / 6.0)
            addChild(pset.pipes.0)
            addChild(pset.pipes.1)
            
            pset.animate(size.width, 5.0)
            nextPipes = false
            run(SKAction.wait(forDuration: pipeInterval), completion: {self.nextPipes = true})
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (firstTouch) {
            birdie.start()
            firstTouch = false
            nextPipes = true
            
        }
        birdie.jump(300)
    }
    
    

}
