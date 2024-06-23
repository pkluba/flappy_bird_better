//
//  City.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 16/05/2024.
//

import UIKit
import SpriteKit

struct Collision{
    static let Birdie:    UInt32 = 0x1 << 0
    static let Pipe:       UInt32 = 0x1 << 1
    static let Border:  UInt32 = 0x1 << 2
}

class City: SKScene, SKPhysicsContactDelegate {
    
    let gameBackground1:Background = Background(imageName: "background")
    let gameBackground2:Background = Background(imageName: "background")
    
    let birdie:Birdie = Birdie(imageName: "bird", scale: 0.05)
    
    let scoreLabel: SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
    

    
    var firstTouch: Bool = true
    var nextPipes: Bool = false
    var pipeInterval: Double = 2.0
    var lastMiddle: Double = 0.0
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "\(score)"
        }
    }
    var gapSize: Double = 0.0
    var lvl: Int = 0
    
    
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        self.physicsWorld.contactDelegate = self
        
        gameBackground1.size = CGSize(width: (gameBackground1.texture!.size().width) * (size.height / gameBackground1.texture!.size().height), height: size.height)
        gameBackground2.size = CGSize(width: (gameBackground2.texture!.size().width) * (size.height / gameBackground2.texture!.size().height), height: size.height)
        gameBackground1.position = CGPoint(x: 0, y: 0)
        gameBackground2.position = CGPoint(x: gameBackground1.size.width, y: 0)

        addChild(gameBackground1)
        addChild(gameBackground2)
        gameBackground1.run(gameBackground1.scroll(10))
        gameBackground2.run(gameBackground2.scroll(10))
        
        birdie.position = CGPoint(x: size.width / 8, y: size.height/2)
        addChild(birdie)
        
        lastMiddle = size.height / 2.0
        gapSize = size.height / 3.5
        
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.position = CGPoint(x: size.width / 2.0, y: size.height * 0.8)
        scoreLabel.zPosition = 4
        scoreLabel.fontSize = size.height / 8.0
        scoreLabel.text = "\(0)"
        addChild(scoreLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        checkBackgrounds()
        checkPipes()
        checkScore()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (firstTouch) {
            birdie.start()
            firstTouch = false
            nextPipes = true
        }
        birdie.jump(300)
    }
    
    func checkBackgrounds() {
        if (gameBackground1.position.x < -gameBackground1.size.width) {
            gameBackground1.position = CGPoint(x: (gameBackground2.position.x + gameBackground1.size.width), y: 0)
        }
        if (gameBackground2.position.x < -gameBackground2.size.width) {
            gameBackground2.position = CGPoint(x: (gameBackground1.position.x + gameBackground2.size.width), y: 0)
        }
    }
    
    func checkPipes() {
        if (nextPipes) {
            let randomBound: Double = (Double(lvl) * (size.height / 10.0))
            
            let nextMiddle: Double = max(gapSize, min((size.height - gapSize), lastMiddle + Double.random(in: -randomBound...randomBound)))
            let pset = PipeSet(middle: nextMiddle, gap: gapSize)
            addChild(pset)
            lastMiddle = nextMiddle
            pset.animate(size.width, 5.0)
            nextPipes = false
            run(SKAction.wait(forDuration: pipeInterval), completion: {self.nextPipes = true})
        }
    }
    
    func checkScore() {
        lvl = (score / 10) + 1
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var first = contact.bodyA
        var sec = contact.bodyB
        if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
            first = contact.bodyB
            sec = contact.bodyA
        }
        
        if (first.categoryBitMask & Collision.Birdie != 0) && (sec.categoryBitMask & Collision.Pipe != 0) {
            self.gameOver()
        }
        
    }
    
    func gameOver() {
        let dimPanel = SKSpriteNode(color: UIColor.black, size: self.size)
        dimPanel.alpha = 0.3
        dimPanel.zPosition = 100
        dimPanel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(dimPanel)
        
        let overLabel: SKLabelNode = SKLabelNode(fontNamed: "Chalkduster")
        
        overLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        overLabel.fontSize = size.height / 4.0
        
        overLabel.horizontalAlignmentMode = .center
        
        overLabel.verticalAlignmentMode = .center
        
        overLabel.text = "Game Over!"
        
        overLabel.zPosition = 101
        self.addChild(overLabel)
        self.isPaused = true
    }

}
