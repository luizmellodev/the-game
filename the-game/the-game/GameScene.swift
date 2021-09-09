//
//  GameScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: - Nodes
    
    private var circle: SKShapeNode = SKShapeNode()
    private var bar: SKShapeNode = SKShapeNode()
    private var squares: SKShapeNode = SKShapeNode()
    private var triangles: SKShapeNode = SKShapeNode()
    
    
    
    // MARK: - Init
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        createCircle()
        createBar()
        //backgroundColor = SKColor.red
    }
    
    // MARK: - Functions
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            bar.position.x = location.x
            bar.position.y = location.y
        }
    }
    
    func createCircle() {
        let circle = SKShapeNode(circleOfRadius: 20)
        let circlePosition = CGPoint(x: 0.0, y: -320.0)
        
        circle.position = circlePosition
        circle.fillColor = UIColor.white
        
        addChild(circle)
    }
    
    func createBar() {
        let bar = SKShapeNode(rectOf: CGSize(width: 130, height: 3))
        let barPosition = CGPoint(x: 0.0, y: -260.0)
        
        bar.position = barPosition
        bar.fillColor = UIColor.white
        
        addChild(bar)
    }
    
    //MARK: - Update
    
    
}
