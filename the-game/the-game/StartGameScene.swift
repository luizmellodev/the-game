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
        self.backgroundColor = UIColor.white
        let startGameButton = SKLabelNode(fontNamed: "SF Pro Display")
        startGameButton.position = CGPoint(x: size.width/2, y: size.height/2)
        startGameButton.name = "startgame"
        startGameButton.text = "Tap to play!"
        startGameButton.fontSize = 20
        startGameButton.fontColor = SKColor.black
        addChild(startGameButton)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let gameOverScene = GameScene(size: size)
            gameOverScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipVertical(withDuration: 2.0)
            view?.presentScene(gameOverScene,transition: transitionType)
            
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
