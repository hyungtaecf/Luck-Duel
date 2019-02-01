//
//  GameOver2ViewController.swift
//  Luck Duel
//
//  Created by 광기전 연구실 on 09/11/2017.
//  Copyright © 2017 606-15. All rights reserved.
//

import UIKit

class GameOver2ViewController: UIViewController {
    @IBOutlet weak var playerWins: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(score1>score2){
            playerWins.text = "PLAYER 1 WINS!"
        }
        else{
            playerWins.text = "PLAYER 2 WINS!"
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

