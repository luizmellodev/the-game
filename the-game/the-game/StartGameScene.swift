//
//  StartGameScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import UIKit
import SpriteKit
class StartGameScene: SKScene {
    let goAhead = SKLabelNode(text: "Go ahead")
    
    override func didMove(to: SKView) {
        self.backgroundColor = UIColor.systemBackground

        showTexts()
    }
    
    func showTexts() {
        goAhead.fontSize = 83.0
        goAhead.fontColor = SKColor.label
        goAhead.fontName = "HelveticaNeue-Bold"
        goAhead.position = CGPoint(x: self.view!.frame.width, y: (self.view!.frame.height / 3))
        goAhead.horizontalAlignmentMode = .right
        addChild(goAhead)
    
        
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
