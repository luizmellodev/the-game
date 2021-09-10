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
    private var bar: SKSpriteNode = SKSpriteNode()
    private var squares: SKShapeNode = SKShapeNode()
    private var triangles: SKShapeNode = SKShapeNode()
    
    
    
    // MARK: - Init
    
    override func didMove(to view: SKView) {
        createCircle()
        createBar()
        createBox()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    // MARK: - Functions
    
    func createCircle() {
        let circle = SKShapeNode(circleOfRadius: 20)
        let circlePosition = CGPoint(x: 0.0, y: -320.0)
        
        circle.position = circlePosition
        circle.fillColor = UIColor.white
        
        self.addChild(circle)
    }
    
    func createBar() {
        bar = SKSpriteNode(color: .white, size:  CGSize(width: 130, height: 3))
        
        bar.position = CGPoint(x: 0.0, y: -260.0)
        bar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.addChild(bar)
    }
    
    func createBox() {
        let box = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        let boxPosition = CGPoint(x: 10, y: 10)
        
        box.position = boxPosition
        
        box.fillColor = .white
        
        self.addChild(box)
    }
    
    
    
    //MARK: - Touches Functions
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        bar.position.x = pos.x
        //bar.position.y = pos.y
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    //MARK: - Update
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
