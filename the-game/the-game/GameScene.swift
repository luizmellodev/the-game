//
//  GameScene.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Nodes
    
    private var circle: SKShapeNode = SKShapeNode()
    private var bar: SKSpriteNode = SKSpriteNode()
    private var box: SKShapeNode = SKShapeNode()
    
    
    // MARK: - Init
    
    override func didMove(to view: SKView) {
        var boxTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("createBox"), userInfo: nil, repeats: true)
        createCircle()
        createBar()
        setPhysics()
        physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    // MARK: - Functions
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node else {return}
        guard let nodeB = contact.bodyB.node else {return}
        
        if nodeA.name == "box" {
            if nodeA.position.x < 0 {
                let randomX = Int.random(in: 0...30)
                let randomY = Int.random(in: 10..<25)
                nodeA.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            else {
                let randomX = Int.random(in: -30...0)
                let randomY = Int.random(in: 10..<25)
                nodeA.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            
            
            
        } else if nodeB.name == "box" {
            if nodeB.position.x < 0 {
                let randomX = Int.random(in: 30...100)
                let randomY = Int.random(in: 50..<100)
                nodeB.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            else {
                let randomX = Int.random(in: -100...(-30))
                let randomY = Int.random(in: 50..<100)
                nodeB.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
        }
        
        
    }
    
    func setPhysics() {
        
        let barPhysicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 130, height: 3))
        barPhysicsBody.isDynamic = false
        barPhysicsBody.affectedByGravity = false
        barPhysicsBody.friction = CGFloat(1)
        barPhysicsBody.categoryBitMask = 00000010
        barPhysicsBody.collisionBitMask = 00000011
        barPhysicsBody.contactTestBitMask = 00000011
        bar.physicsBody = barPhysicsBody
    }
    
    func createCircle() {
        circle = SKShapeNode(circleOfRadius: 20)
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
    
    @objc func createBox() {
        let box = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        
        //posicao random das caixas
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        box.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) * x), y: self.frame.size.height/2)
        box.fillColor = .white
        box.name = "box"
        
        //coloquei boxPhysicsBody aqui pra n precisar por a funcao setPhysics no update
        let boxPhysicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        boxPhysicsBody.isDynamic = true
        boxPhysicsBody.allowsRotation = true
        boxPhysicsBody.affectedByGravity = true
        boxPhysicsBody.friction = CGFloat(1)
        boxPhysicsBody.categoryBitMask = 00000001
        boxPhysicsBody.collisionBitMask = 00000010
        boxPhysicsBody.contactTestBitMask = 00000010
        boxPhysicsBody.restitution = 0.5
        box.physicsBody = boxPhysicsBody
        box.physicsBody?.linearDamping = 0.5
        
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
        guard let scene = scene else {return}
        scene.enumerateChildNodes(withName: "box", using: { node, _ in
            let positionVector = CGPoint(x: 0.0 - node.position.x, y: -320 - node.position.y)
            node.physicsBody?.applyForce(CGVector(dx: positionVector.x, dy: positionVector.y))
            if node.position.y < -(scene.frame.height)/2 {
                node.removeFromParent()
            }
        })
    }
    
}
