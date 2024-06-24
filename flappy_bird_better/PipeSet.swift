//
//  PipeSet.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 22/06/2024.
//

import UIKit
import SpriteKit

class PipeSet: SKNode {
    
    var pipe0:Pipe
    var pipe1:Pipe
    
    init(middle: Double, gap: Double) {
       
        
        pipe0 = Pipe(imageName: "pipeup", orientation: "up", ending: middle - (gap / 2.0))
        pipe1 = Pipe(imageName: "pipedown", orientation: "down", ending: middle + (gap / 2.0))
        
        super.init()
        
        self.zPosition = 1
        
        addChild(pipe0)
        addChild(pipe1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func animate(_ scene_start: Double, _ duration: Double) {
        pipe0.run(pipe0.animation(scene_start, duration))
        pipe1.run(pipe1.animation(scene_start, duration))
        
        run(SKAction.sequence([SKAction.wait(forDuration: duration), SKAction.run {
            if ((self.parent as? City)?.over == false) {
                (self.parent as? City)?.score += 1 }       }, SKAction.removeFromParent()]))
    }
}
