//
//  GameScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.red
        NSLog("We have loaded the start screen")
    }
}
