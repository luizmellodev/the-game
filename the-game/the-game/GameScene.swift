//
//  GameScene.swifts
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import SpriteKit
import GameplayKit


var scoreLabel: SKLabelNode = SKLabelNode()

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Nodes
    
    private var circle: SKShapeNode = SKShapeNode()
    private var bar: SKSpriteNode = SKSpriteNode()
    private var box: SKShapeNode = SKShapeNode()
    private var messageLevel: SKLabelNode = SKLabelNode()
    private var levelText: SKLabelNode = SKLabelNode()
    var circleGravity: Bool = false
    var speedBox: Double = 2
    var speedCircle: Double = 1.5

    var lastUpdateTime: TimeInterval?
    var count = 0
    
    // MARK: - Init
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.systemBackground
        createCircle()
        createBar()
        setPhysics()
        createScore()
        circleAction(speedCircle: speedCircle)
        showDifficulty()
        physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    // MARK: - Functions
    func levelManagement(level: Int){
        switch level {
        case 10:
            speedBox = 1.5
            speedCircle = 1
            circleAction(speedCircle: speedCircle)
            messageLevel.text = "Velocidade alterada para \(speedBox) km/h da queda e \(speedCircle) km/h do círculo"
        case 20:
            speedBox = 1
            speedCircle = 0.7
            circleAction(speedCircle: speedCircle)
            messageLevel.text = "Velocidade alterada para \(speedBox) km/h da queda e \(speedCircle) km/h do círculo"
        case 30:
            circleGravity = true
            messageLevel.text = "gravidade do círculo *ATIVADA*"
        case 50:
            speedBox = 0.3
            messageLevel.text = "Velocidade alterada para \(speedBox) km/h da queda e \(speedCircle) km/h do círculo"
        case 70:
            speedBox = 0.1
            messageLevel.text = "Velocidade alterada para \(speedBox) km/h da queda e \(speedCircle) km/h do círculo"
        default:
            speedBox = 5
            circleGravity = false
            messageLevel.text = "Ops, você é tão bom que quebrou o jogo! =)"
        }
    }
    
    func showDifficulty(){
        messageLevel = SKLabelNode()
        messageLevel.name = "messageLevel"
        messageLevel.position = CGPoint(x: 0.0, y: -250)
        messageLevel.fontSize = 15
        messageLevel.fontColor = SKColor.gray
        messageLevel.text = "A velocidade está em \(speedBox)... vamos ver e você é bom.."
        self.addChild(messageLevel)
    }
    
    func showLevel(){
        levelText = SKLabelNode()
        levelText.name = "levelText"
        levelText.fontName = "HelveticaNeue-Bold"
        levelText.position = CGPoint(x: 0.0, y: 0.0)
        levelText.fontSize = 70
        levelText.fontColor = SKColor.gray
        levelText.text = "level \(count)"
        levelText.zPosition = -1
        
        self.addChild(levelText)
    }
    
    func createScore(){
        scoreLabel = SKLabelNode()
        scoreLabel.name = "scoreLabel"
        scoreLabel.position = CGPoint(x: 0.0, y: -200.0)
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.blue
        scoreLabel.text = "\(count)"
        
        self.addChild(scoreLabel)
    }
    
    func displayGameOver() {
        let gameOverScene = GameOverScene(size: size)
        gameOverScene.scaleMode = scaleMode
        
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        view?.presentScene(gameOverScene, transition: reveal)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node else {return}
        guard let nodeB = contact.bodyB.node else {return}
        
        
        //GameOver (caixa tocou no círculo - caixa é o bodyA)
        if nodeB.name == "circle" {
            displayGameOver()
        }
        
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
        
        let circlePhysicsBody = SKPhysicsBody(circleOfRadius: 40)
        circlePhysicsBody.isDynamic = false
        circlePhysicsBody.affectedByGravity = false
        circlePhysicsBody.categoryBitMask = 00000010
        circlePhysicsBody.collisionBitMask = 00000001
        circlePhysicsBody.contactTestBitMask = 00000001
        circle.physicsBody = circlePhysicsBody
    }
    
    func createCircle() {
        
        circle = SKShapeNode(circleOfRadius: 40)
        let circlePosition = CGPoint(x: 0.0, y: -320.0)
        circle.position = circlePosition
        circle.fillColor = UIColor.label
        circle.name = "circle"
        
        self.addChild(circle)
    }
    
    func circleAction(speedCircle: Double){
        let left = SKAction.move(to: CGPoint(x: -150, y: circle.position.y), duration: speedCircle)
        let right = SKAction.move(to: CGPoint(x: 150, y: circle.position.y), duration: speedCircle)
        let sequenceAction = SKAction.sequence([left, right])
        let actionForever = SKAction.repeatForever(sequenceAction)
        circle.run(actionForever)
    }
    
    func createBar() {
        bar = SKSpriteNode(color: UIColor.label, size:  CGSize(width: 130, height: 10))
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
        box.fillColor = UIColor.label
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
        boxPhysicsBody.allowsRotation = true
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
            if(self.circleGravity){
                let positionVector = CGPoint(x: 0.0 - node.position.x, y: -320 - node.position.y)
                node.physicsBody?.applyForce(CGVector(dx: positionVector.x, dy: 0))
            }
            if (node.position.y < -(scene.frame.height)/2) || (node.position.x > scene.frame.width || node.position.x < -(scene.frame.width)) {
                node.removeFromParent()
            }
        })
        
        var delta = TimeInterval()
        if let last = lastUpdateTime {
            delta = currentTime - last
        } else {
            delta = currentTime
        }
        if delta > 1.0 {
            //tick tock, a second has passed, update lastUpdateTime
            lastUpdateTime = currentTime
            count += 1
            scoreLabel.text = "\(count)"
            if(count == 10 || count == 20 || count == 30 || count == 50){
                levelManagement(level: count)
                showLevel()
            }
            var boxTimer = Timer.scheduledTimer(timeInterval: speedBox, target: self, selector: Selector("createBox"), userInfo: nil, repeats: true)
            print("Círculo: \(speedCircle)")
            print("Box: \(speedBox)")

        }
    }
    
}
