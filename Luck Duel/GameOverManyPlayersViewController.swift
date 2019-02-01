//
//  GameOverManyPlayersViewController.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 21..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class GameOverManyPlayersViewController: UIViewController {

    @IBOutlet weak var playerWins: UILabel!
    @IBOutlet var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for player in playerList{
            if(!player.eliminated){
                playerWins.text = player.name.map { $0 + " WINS!!" }
                avatar.image = player.image
                break
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAgain(_ sender: UIButton) {
        playerList.removeAll()
        numberOfPlayers = 0
        playerList = Array<Player>()
        createdPlayers = 0
        alivePlayers = 0
        playerTurn = 0
        numberOfJokers = 1
        performSegue(withIdentifier: "restart", sender: self)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
