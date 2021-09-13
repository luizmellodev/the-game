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


    override init(size: CGSize) {
        super.init(size: size)

        self.backgroundColor = SKColor.systemGray

        over.fontSize = 96.0
        over.color = UIColor.systemGray6
        over.position = CGPoint(x: (size.width / 3) - 10, y: size.height/2)
        addChild(over)
        
        game.fontSize = 96.0
        game.color = UIColor.systemGray6
        game.position = CGPoint(x: (size.width / 3) + 10, y: (size.height / 2) + 70)
        addChild(game)

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
