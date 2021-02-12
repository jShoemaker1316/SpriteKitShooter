//
//  EnemyType.swift
//  SpriteKitShooter
//
//  Created by Jonathan Shoemaker on 2/12/21.
//

import SpriteKit

struct EnemyType: Codable {
    var name: String
    var shields: Int
    var speed: CGFloat
    var powerUpChance: Int
}
