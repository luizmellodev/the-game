//
//  StartGameScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import UIKit
import SpriteKit
class StartGameScene: SKScene {
    
    override func didMove(to: SKView) {
        let startGameButton = SKSpriteNode(imageNamed: "botao")
        startGameButton.position = CGPoint(x: size.width/2, y: size.height/2 - 100)
        startGameButton.name = "startgame"
        addChild(startGameButton)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "startgame" {
                let gameOverScene = GameScene(size: size)
                gameOverScene.scaleMode = scaleMode
                let transitionType = SKTransition.flipVertical(withDuration: 2.0)
                view?.presentScene(gameOverScene,transition: transitionType)
            }
        }
    }
    
    //    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    //        for touch in touches {
    //            let touchLocation = (touch as AnyObject).location(self)
    //            let touchedNode = self.atPoint(touchLocation)
    //            if(touchedNode.name == "startgame"){
    //                let gameOverScene = GameScene(size: size)
    //                gameOverScene.scaleMode = scaleMode
    //                let transitionType = SKTransition.flipHorizontal(withDuration: 1.0)
    //                view?.presentScene(gameOverScene,transition: transitionType)
    //            }
    //        }
    //    }
}
