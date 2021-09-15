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
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
//    let systemFont = UIFont.systemFont(ofSize: 96.0)
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.systemBackground

        showTexts()
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
        addChild(game)
        
        over.fontSize = 96.0
        over.fontColor = SKColor.label
        over.fontName = "HelveticaNeue-Bold"
        over.position = CGPoint(x: size.width / 3, y: size.height - 240)
        addChild(over)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        view?.presentScene(gameScene, transition: reveal)
    }
}
