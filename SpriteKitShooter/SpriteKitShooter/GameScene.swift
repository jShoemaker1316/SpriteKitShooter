//
//  GameScene.swift
//  SpriteKitShooter
//
//  Created by Jonathan Shoemaker on 2/12/21.
//

import SpriteKit
//create enum to describe all collision types (UInt32)
enum CollisionType: UInt32 {
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "player")
    
    //now with Bundle Decoding finished we can add our enemy type and wave jsons in
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    let enemyTypes = Bundle.main.decode([EnemyType].self, from: "enemy-types.json")
    
    override func didMove(to view: SKView) {
        if let particles = SKEmitterNode(fileNamed: "Starfield") {
            particles.position = CGPoint(x: 1080, y: 0)
            //need to make sure the snow/stars are already going when ganme is started. set it 1 minute into the game already
            particles.advanceSimulationTime(60)
            particles.zPosition = -1
            addChild(particles)
        }
        //set the sprite amnd position
        player.name = "player"
        player.position.x = frame.minX + 75
        player.zPosition = 1
        addChild(player)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.collisionBitMask = CollisionType.enemy.rawValue | CollisionType.enemyWeapon.rawValue
        //tell us about when things collide and bounce off
        player.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue | CollisionType.enemyWeapon.rawValue
        //get rid of gravity
        player.physicsBody?.isDynamic = false
    }
        
}
