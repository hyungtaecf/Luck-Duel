//
//  Player.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 20..
//  Copyright © 2017년 606-15. All rights reserved.
//

import Foundation
import UIKit

class Player{
    var name: String?
    var image: UIImage?
    var eliminated: Bool
    init(_ name: String?, _ image: UIImage?){
        self.name = name
        self.image = image
        eliminated = false
    }
}
