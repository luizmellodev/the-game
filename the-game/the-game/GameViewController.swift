//
//  GameViewController.swift
//  the-game
//
//  Created by Luiz Eduardo Mello dos Reis on 09/09/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let screenSize = CGSize(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
            let scene = StartGameScene(size: screenSize)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true    
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
