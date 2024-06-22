//
//  PipeSet.swift
//  flappy_bird_better
//
//  Created by Piotr Kluba on 22/06/2024.
//

import Foundation
import UIKit
import SpriteKit

class PipeSet {
    
    var pipes: (Pipe, Pipe)
    
    init(middle: Double, gap: Double) {
        pipes.0 = Pipe(imageName: "pipe", orientation: "up", ending: middle - (gap / 2.0))
        pipes.1 = Pipe(imageName: "pipe", orientation: "down", ending: middle + (gap / 2.0))
    }
    

    
    func animate(_ scene_start: Double, _ duration: Double) {
        pipes.0.run(SKAction.sequence([pipes.0.animation(scene_start, duration), SKAction.removeFromParent()]))
        pipes.1.run(SKAction.sequence([ pipes.1.animation(scene_start, duration), SKAction.run {
            (self.pipes.1.parent as? City)?.score += 1        }, SKAction.removeFromParent()]))
    }
}
