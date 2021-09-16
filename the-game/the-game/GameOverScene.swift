//
//  GameOverScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 13/09/21.
//

import SpriteKit
import GameplayKit

class GameOverScene: SKScene {
    var over = SKLabelNode(text: "Over")
    var game = SKLabelNode(text: "Game")
    var score = SKLabelNode(text: "\(scoreLabel.text!)")
    var score2 = SKLabelNode(text: "Score")
    
    private var rings: [RingPart] = []
    
    private var motivationMessage: SKLabelNode = SKLabelNode(text: "Looks like you didn`t resist the blocks` attacks!")
    private var tryAgain: SKShapeNode = SKShapeNode()
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    let systemFont = UIFont.systemFont(ofSize: 96.0)
    
    //MARK: - didMove
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.systemBackground
        showTexts()
        
        //Rings calls
        createFirstRings()
        createSecondRings()
        createThirdRings()
        createFourthRings()
        
        //button
        let tryAgain = SKShapeNode(rectOf: CGSize(width: 342, height: 54), cornerRadius: 10)
        tryAgain.position = CGPoint(x: self.view!.frame.width / 2, y: self.frame.minY + 80)
        tryAgain.fillColor = UIColor.label
        tryAgain.name = "tryAgain"
        
        self.addChild(tryAgain)
        
        let tryAgainLabel = SKLabelNode(text: "Try Again")
        tryAgainLabel.fontSize = 20.0
        tryAgainLabel.fontColor = SKColor.systemBackground
        tryAgainLabel.fontName = "HelveticaNeue-Bold"
        tryAgainLabel.position = CGPoint(x: 0, y: -5)
        tryAgainLabel.horizontalAlignmentMode = .center
        
        tryAgain.addChild(tryAgainLabel)
        
        //message
        motivationMessage.fontSize = 14.0
        motivationMessage.fontColor = SKColor.label
        motivationMessage.fontName = "HelveticaNeue-Regular"
        motivationMessage.position = CGPoint(x: tryAgain.frame.width, y: tryAgain.frame.maxY + 20)
        motivationMessage.horizontalAlignmentMode = .right
        motivationMessage.zPosition = 1
        motivationMessage.lineBreakMode = .byWordWrapping
        motivationMessage.numberOfLines = 4
        addChild(motivationMessage)
    }
    
    func showTexts() {
        // fonta name "HelveticaNeue-UltraLight"
        
        score2.fontSize = 50.0
        score2.fontColor = SKColor.label
        score2.fontName = "HelveticaNeue-Bold"
        score2.position = CGPoint(x: self.view!.frame.width - 24, y: self.view!.frame.height / 2)
        score2.horizontalAlignmentMode = .right
        addChild(score2)
        
        
        score.fontSize = 50.0
        score.fontColor = SKColor.label
        score.fontName = "HelveticaNeue-Light"
        score.position = CGPoint(x: score2.frame.maxX , y: score2.frame.minY - score.frame.height - 10)
        score.horizontalAlignmentMode = .right
        addChild(score)
        
        
        game.fontSize = 96.0
        game.fontColor = SKColor.label
        game.fontName = "HelveticaNeue-Bold"
        game.position = CGPoint(x: (size.width / 3) + 25, y: size.height - 150)
        //        game.lineBreakMode = NSLineBreakMode.byWordWrapping
        //        game.numberOfLines = 0
        addChild(game)
        
        over.fontSize = 96.0
        over.fontColor = SKColor.label
        over.fontName = "HelveticaNeue-Bold"
        over.position = CGPoint(x: size.width / 3, y: size.height - 240)
        addChild(over)
    }
    
    //MARK: - Animated Rings
    
    func createFirstRings() {
        let nodePosition = CGPoint(x: self.frame.maxX/2 , y: self.frame.minY/2 + 280)
        
        //Ring/Ellipse 1
        let node = SKSpriteNode(imageNamed: "ring1")
        
        node.position = nodePosition
        node.zPosition = 1
        
        let ring1 = RingPart(type: RingPart.RingSpritesNodes.ring1, position: nodePosition, node: node)
        
        rings.append(ring1)
        
        node.run(.sequence([
            .wait(forDuration: 0),
            .repeatForever(.sequence([
                // A group of actions get performed simultaneously
                .group([
                    .sequence([
                        .scale(to: 1.5, duration: 0.1),
                        .scale(to: 1, duration: 1.1)
                    ]),
                    // Rotate by 360 degrees (pi * 2 in radians)
                    .rotate(byAngle: .pi * 2, duration: 0.6)
                ]),
                .wait(forDuration: 0)
            ]))
        ]))
        
        addChild(node)
    }
    
    func createSecondRings() {
        let nodePosition = CGPoint(x: self.frame.maxX/2 , y: self.frame.minY/2 + 280)
        
        //Ring/Ellipse 2
        let node = SKSpriteNode(imageNamed: "ring2")
        
        node.position = nodePosition
        node.zPosition = 1
        
        let ring2 = RingPart(type: RingPart.RingSpritesNodes.ring2, position: nodePosition, node: node)
        
        rings.append(ring2)
        
        node.run(.sequence([
            .wait(forDuration: 0),
            .repeatForever(.sequence([
                // A group of actions get performed simultaneously
                .group([
                    .sequence([
                        .scale(to: 1.5, duration: 0.1),
                        .scale(to: 1, duration: 1.1)
                    ]),
                    // Rotate by 360 degrees (pi * 2 in radians)
                    .rotate(byAngle: .pi * 2, duration: 0.6)
                ]),
                .wait(forDuration: 0)
            ]))
        ]))
        
        addChild(node)
    }
    
    func createThirdRings() {
        let nodePosition = CGPoint(x: self.frame.maxX/2 , y: self.frame.minY/2 + 280)
        
        //Ring/Ellipse 3
        let node = SKSpriteNode(imageNamed: "ring3")
        
        node.position = nodePosition
        node.zPosition = 1
        
        let ring3 = RingPart(type: RingPart.RingSpritesNodes.ring3, position: nodePosition, node: node)
        
        rings.append(ring3)
        
        node.run(.sequence([
            .wait(forDuration: 0),
            .repeatForever(.sequence([
                // A group of actions get performed simultaneously
                .group([
                    .sequence([
                        .scale(to: 1.5, duration: 0.1),
                        .scale(to: 1, duration: 1.1)
                    ]),
                    // Rotate by 360 degrees (pi * 2 in radians)
                    .rotate(byAngle: .pi * 2, duration: 0.6)
                ]),
                .wait(forDuration: 0)
            ]))
        ]))
        
        addChild(node)
    }
    
    func createFourthRings() {
        let nodePosition = CGPoint(x: self.frame.maxX/2 , y: self.frame.minY/2 + 280)
        
        //Ring/Vector 4
        let node = SKSpriteNode(imageNamed: "ring4")
        
        node.position = nodePosition
        node.zPosition = 1
        
        let ring4 = RingPart(type: RingPart.RingSpritesNodes.ring4, position: nodePosition, node: node)
        
        rings.append(ring4)
        
        addChild(node)
    }
    
    //MARK: - Motivation Message and Button Try Again
    
    //    func createMotivationMessage() {
    //        motivationMessage.fontSize = 14.0
    //        motivationMessage.fontColor = .black
    //        motivationMessage.fontName = "HelveticaNeue-Regular"
    //        motivationMessage.position = CGPoint(x: tryAgain.frame.width, y: tryAgain.frame.maxY + 20)
    //        motivationMessage.zPosition = 1
    //        motivationMessage.horizontalAlignmentMode = .right
    ////        motivationMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
    ////        motivationMessage.numberOfLines = 0
    //        self.addChild(motivationMessage)
    //
    //    }
    //
    //    func createTryAgain() {
    //        let tryAgain = SKShapeNode(rectOf: CGSize(width: 342, height: 54), cornerRadius: 10)
    //        let nodePosition = CGPoint(x: self.view!.frame.width/2 , y: self.view!.frame.minY + 80)
    //        tryAgain.position = nodePosition
    //        tryAgain.zPosition = 1
    //        tryAgain.fillColor = .label
    //
    //        self.addChild(tryAgain)
    //
    //        let tryAgainLabel = SKLabelNode(text: "Try again")
    //        tryAgainLabel.fontSize = 15.0
    //        tryAgainLabel.fontColor = SKColor.systemBackground
    //        tryAgainLabel.fontName = "HelveticaNeue-Bold"
    //        tryAgainLabel.position = CGPoint(x: 0, y: -5)
    //        tryAgainLabel.horizontalAlignmentMode = .center
    //
    //        tryAgain.addChild(tryAgainLabel)
    //    }
    
    //MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                
                enumerateChildNodes(withName: "//*") { (node, stop) in
                    if node.name == "tryAgain" {
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
}
