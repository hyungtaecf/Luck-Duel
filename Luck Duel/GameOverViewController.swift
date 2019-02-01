//
//  GameOverViewController.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 9..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playAgain(_ sender: UIButton) {
        numberOfJokers = 1
        score = 0
        performSegue(withIdentifier: "restart1", sender: self)
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
