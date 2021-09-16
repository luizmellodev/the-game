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
    private var bar: SKShapeNode = SKShapeNode()
    private var box: SKShapeNode = SKShapeNode()
    private var levelText: SKLabelNode = SKLabelNode()
    private var godmodText: SKLabelNode = SKLabelNode()
    private var godmod: Bool = false
    private var barWidth: Double = 130
    private var isTouched: Bool = false
    private var scoreLabel2: SKLabelNode = SKLabelNode()
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
        godmodTextFunc()
        circleAction(speedCircle: speedCircle)
        physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    // MARK: - Functions
    func levelManagement(level: Int){
        switch level {
        case 10:
            speedCircle = 1
            speedBox = 1.5
            circleAction(speedCircle: speedCircle)
        case 30:
            speedBox = 1.3
            speedCircle = 0.9
            circleAction(speedCircle: speedCircle)
        case 50:
            speedBox = 1.0
            speedCircle = 0.8
        case 100:
            speedBox = 0.7
            speedCircle = 0.4
        case 130:
            circleGravity = true
        default:
            speedBox = 0.5
            circleGravity = false
        }
    }
    @objc func showLevel(){
        let levelText = SKLabelNode()
        levelText.name = "levelText"
        levelText.fontName = "HelveticaNeue-Bold"
        levelText.position = CGPoint(x: 0.0, y: 0.0)
        levelText.fontSize = 70
        levelText.fontColor = SKColor.gray
        levelText.text = "level \(count)"
        levelText.zPosition = -1
        levelText.alpha = 0
        
        let fadeIn = SKAction.fadeIn(withDuration: 2)
        let fadeOut = SKAction.fadeOut(withDuration: 2)
        
        let sequence = SKAction.sequence([fadeIn, fadeOut])
        levelText.run(sequence)
        self.levelText = levelText
        
        self.addChild(levelText)
        _ = Timer.scheduledTimer(timeInterval: speedBox, target: self, selector: #selector(createBox), userInfo: nil, repeats: true)
    }
    
    func createScore(){
        scoreLabel = SKLabelNode()
        scoreLabel.name = "scoreLabel"
        scoreLabel.position = CGPoint(x: ((self.view?.bounds.size.width ?? 0) / 2) - 30, y: ((self.view?.bounds.size.height ?? 0) / 3) + 10)
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.label
        scoreLabel.text = "\(count)"
        
        scoreLabel2 = SKLabelNode()
        scoreLabel2.name = "scoreLabel2"
        scoreLabel2.fontSize = 20
        scoreLabel2.fontColor = SKColor.label
        scoreLabel2.text = "Score"
        scoreLabel2.position = CGPoint(x: ((self.view?.bounds.size.width ?? 0) / 2) - 40, y: ((self.view?.bounds.size.height ?? 0) / 3) + 35)
        
        self.addChild(scoreLabel2)
        self.addChild(scoreLabel)
    }
    
    func godmodTextFunc(){
        let godmodText = SKLabelNode()
        godmodText.name = "godmodText"
        godmodText.position = CGPoint(x: 0, y: -250)
        godmodText.fontSize = 15
        godmodText.fontColor = SKColor.orange
        godmodText.text = "U found an easter egg! GOD MODE ACTIVATED =)"
        godmodText.fontName = "HelveticaNeue-Normal"
        
        self.godmodText = godmodText
        
        self.godmodText.alpha = 0.0
        
        self.addChild(self.godmodText)
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
                let randomX = Int.random(in: 100...200)
                let randomY = Int.random(in: 70...100)
                nodeA.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            else {
                let randomX = Int.random(in: -200...(-100))
                let randomY = Int.random(in: 70...100)
                nodeA.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            
            
            
        } else if nodeB.name == "box" {
            if nodeB.position.x < 0 {
                let randomX = Int.random(in: 100...200)
                let randomY = Int.random(in: 70..<100)
                nodeB.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
            }
            else {
                let randomX = Int.random(in: -200...(-100))
                let randomY = Int.random(in: 70...100)
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
        circle.strokeColor = UIColor.label
        circle.name = "circle"
        
        self.addChild(circle)
    }
    
    func circleAction(speedCircle: Double){
        let left = SKAction.move(to: CGPoint(x: (self.frame.size.width/2 - 20), y: circle.position.y), duration: speedCircle)
        let right = SKAction.move(to: CGPoint(x: -(self.frame.size.width/2 - 20), y: circle.position.y), duration: speedCircle)
        let sequenceAction = SKAction.sequence([left, right])
        let actionForever = SKAction.repeatForever(sequenceAction)
        circle.run(actionForever)
    }
    
    func createBar() {
        //        bar = SKSpriteNode(color: UIColor.label, size:  CGSize(width: self.barWidth, height: 10))
        bar = SKShapeNode(rectOf: CGSize(width: self.barWidth, height: 10), cornerRadius: 7.0)
        bar.fillColor = UIColor.label
        bar.position = CGPoint(x: 0.0, y: -260.0)
        bar.strokeColor = UIColor.label
        //        bar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.addChild(bar)
    }
    
    //modo desenvolvedor (NAO USAR)
    func godmodFunc(speedCircle: Double, godmod: Bool){
        if(self.godmod == true){
            self.backgroundColor = UIColor.darkGray
            self.godmodText.alpha = 1.0
            bar.run(SKAction.moveTo(x: circle.position.x, duration: 0.0))
        }
        else{
            self.backgroundColor = UIColor.systemBackground
            self.godmodText.alpha = 0.0
            //            childNode(withName: "godmodText")?.removeFromParent()
            bar.removeAllActions()
        }
        
    }
    
    @objc func createBox() {
        let box = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
        
        //posicao random das caixas
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        box.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width - 30))) * x), y: self.frame.size.height/2)
        box.fillColor = UIColor.label
        box.strokeColor = UIColor.label
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
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
            
            let touch = touches.first!
            if scoreLabel.contains(touch.location(in: self)) {
                print("tocou")
                if(self.godmod == false){
                    self.barWidth = 370
                    self.godmod = true
                }
                else{
                    self.barWidth = 130
                    self.godmod = false
                }
            }
        }
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
            if(count == 1 || count == 10 || count == 20 || count == 30 || count == 50){
                levelManagement(level: count)
                levelText.removeFromParent()
                showLevel()
            }
            print("Círculo: \(speedCircle)")
            print("Box: \(speedBox)")
        }
        godmodFunc(speedCircle: speedCircle, godmod: self.godmod)
    }
    
}
