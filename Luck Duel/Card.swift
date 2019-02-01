//
//  Card.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 6..
//  Copyright © 2017년 606-15. All rights reserved.
//

import Foundation
import UIKit

class Card{
    var face: Bool              //true = up, false = down
    var image: UIImage?
    var button: UIButton!
    init(_ image: UIImage?, _ button: UIButton!){
        face = false;
        self.image = image
        self.button = button
    }
    func setImage(_ image: UIImage?){
        self.image = image
        return
    }
    func faceUp(){
        face = true
        button.setImage(image, for: [])
    }
    func isFaceUp()->Bool{
        return face
    }
    // Do any additional setup after loading the view.
}
