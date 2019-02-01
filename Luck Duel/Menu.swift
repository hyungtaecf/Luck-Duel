//
//  Two_Player.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 3..
//  Copyright © 2017년 606-15. All rights reserved.
//

import Foundation
import UIKit

class Menu: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
    }
    
    @IBAction func twoPlayerMode(_ sender: UIButton) {
        performSegue(withIdentifier: "test", sender: self)
    }
    
    @IBAction func onePlayerMode(_ sender: UIButton) {
        performSegue(withIdentifier: "onePlayerMode", sender: self)
    }
    /*@IBAction func manyPlayerMode(_ sender: UIButton) {
        performSegue(withIdentifier: "manyPlayerMode", sender: self)
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
}
