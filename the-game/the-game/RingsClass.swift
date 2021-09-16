//
//  RingsClass.swift
//  the-game
//
//  Created by Rodrigo de Anhaia on 15/09/21.
//

import UIKit
import SpriteKit

class RingPart {
    var type: RingSpritesNodes
    var position: CGPoint
    var node: SKSpriteNode
    
    enum RingSpritesNodes {
        case ring1
        case ring2
        case ring3
        case ring4
        
    }
//
//    enum RingType: Int  {
//
//        case firstSnake = 0, secondSnake, thirdSnake
//
//        func simpleDescription()->String    {
//            switch self {
//
//            case .firstSnake:
//                return "head"
//
//            case .secondSnake:
//                return "body"
//
//            case .thirdSnake:
//                return "tail"
//            }
//        }
//    }
    
    init(type: RingSpritesNodes, position: CGPoint, node: SKSpriteNode) {
        self.type = type
        self.position = position
        self.node = node
    }
}
