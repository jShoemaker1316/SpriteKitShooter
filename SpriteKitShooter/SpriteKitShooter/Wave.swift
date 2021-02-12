//
//  Wave.swift
//  SpriteKitShooter
//
//  Created by Jonathan Shoemaker on 2/12/21.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        var position: Int
        var xOffset: CGFloat
        var moveStraight: Bool
    }
    
    var name: String
    var enemies: [WaveEnemy]
}
