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
    let mission = SKLabelNode(text: "Mission:")
    let stayAlive = SKLabelNode(text: "Stay alive")
    var gameEx = SKSpriteNode()
    let desc = SKLabelNode(text: "desc")
    
    override func didMove(to: SKView) {
        self.backgroundColor = UIColor.systemBackground

        showTexts()
        
        gameEx = SKSpriteNode(imageNamed: "gameEx")
        gameEx.position = CGPoint(x:self.view!.frame.width / 2, y: (self.view!.frame.height / 2) + 60)
        gameEx.zPosition = 0
        addChild(gameEx)

        
        let startBtn = SKShapeNode(rectOf: CGSize(width: 342, height: 54), cornerRadius: 10)
        startBtn.position = CGPoint(x: self.view!.frame.width / 2, y: self.frame.minY + 80)
        startBtn.fillColor = UIColor.label
        startBtn.name = "startBtn"
        self.addChild(startBtn)
        
        let startLabel = SKLabelNode(text: "Start")
        startLabel.fontSize = 20.0
        startLabel.fontColor = SKColor.systemBackground
        startLabel.fontName = "HelveticaNeue-Bold"
        startLabel.position = CGPoint(x: 0, y: -5)
        startLabel.horizontalAlignmentMode = .center
        startBtn.addChild(startLabel)
        
        
        desc.text = "You need to block all blocks that are attacking \nyour circle. An attack in the best kamikaze style \nfalling from Limbo. You have a magic bar to \ndefend yourself, and that's it."
        desc.fontSize = 14.0
        desc.fontColor = SKColor.label
        desc.fontName = "HelveticaNeue-Regular"
        desc.position = CGPoint(x: startBtn.frame.width, y: startBtn.frame.maxY + 20)
        desc.horizontalAlignmentMode = .right
        desc.zPosition = 1
        desc.lineBreakMode = .byWordWrapping
        desc.numberOfLines = 4
        addChild(desc)
        
     
    }
    
    func showTexts() {
        
        
        goAhead.fontSize = 70.0
        goAhead.fontColor = SKColor.label
        goAhead.fontName = "HelveticaNeue-Bold"
        goAhead.position = CGPoint(x: (self.view!.frame.width - 37), y: self.view!.frame.maxY - goAhead.frame.maxY - 64)
        goAhead.horizontalAlignmentMode = .right
        addChild(goAhead)
        
        
        mission.fontSize = 14.0
        mission.fontColor = SKColor.label
        mission.fontName = "HelveticaNeue-Bold"
        mission.position = CGPoint(x: goAhead.frame.minX, y: goAhead.frame.minY - 30)
        mission.horizontalAlignmentMode = .left
        addChild(mission)
        
        
        stayAlive.fontSize = 12.0
        stayAlive.fontColor = SKColor.label
        stayAlive.fontName = "HelveticaNeue-Regular"
        stayAlive.position = CGPoint(x: mission.frame.minX, y: mission.frame.minY - 20)
        stayAlive.horizontalAlignmentMode = .left
        addChild(stayAlive)
    
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                
                enumerateChildNodes(withName: "//*") { (node, stop) in
                    if node.name == "startBtn" {
                        if node.contains(touch.location(in: self)) {
                            let gameScene = GameScene(size: self.size)
                            gameScene.scaleMode = self.scaleMode
                            
                            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                            self.view?.presentScene(gameScene, transition: reveal)
                        }
                    }
                }
            }
        }
    
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: self)
//            let gameOverScene = GameScene(size: size)
//            gameOverScene.scaleMode = scaleMode
//            let transitionType = SKTransition.flipVertical(withDuration: 2.0)
//            view?.presentScene(gameOverScene,transition: transitionType)
//
//        }
//    }
    
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
