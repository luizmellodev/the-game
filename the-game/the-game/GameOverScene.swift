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
    var score2 = SKLabelNode(text: "pontos")
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    let systemFont = UIFont.systemFont(ofSize: 96.0)
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        showTexts()
    }
    
    func showTexts(){
        score.fontSize = 150
        score.fontColor = UIColor.blue
        score.fontName = "TimesNewRomanPSMT"
        score.position = CGPoint(x: (0), y: 30)
        addChild(score)
        
        
        score2.fontSize = 50
        score2.fontColor = UIColor.gray
        score2.position = CGPoint(x: 0, y: 0)
        addChild(score2)
        
        
        
        game.fontSize = 96.0
        game.fontColor = UIColor.label
        game.fontName = "TimesNewRomanPSMT"
        game.position = CGPoint(x: (size.width / 3) + 10, y: size.height - 150)
        addChild(game)
        
        over.fontSize = 96.0
        over.fontColor = UIColor.label
        over.fontName = "TimesNewRomanPSMT"
        over.position = CGPoint(x: (size.width / 3) - 15, y: size.height - 240)
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
