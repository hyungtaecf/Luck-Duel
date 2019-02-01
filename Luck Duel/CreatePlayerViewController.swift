//
//  CreatePlayerViewController.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 20..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

var numberOfPlayers = 0
var playerList = Array<Player>()
var createdPlayers = 0
var alivePlayers = 0
var playerTurn = 0 //Who's turn, index of list of players
var numberOfJokers = 1
var score = 0

class CreatePlayerViewController: UIViewController {
    @IBOutlet var numberOfPlayersLabel: UILabel!
    @IBOutlet var numberOfPlayersStepper: UIStepper!
    @IBOutlet var numberOfJokersLabel: UILabel!
    @IBOutlet var numberOfJokersStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPlayers = Int(numberOfPlayersStepper.value)
        numberOfPlayersLabel.text = String(numberOfPlayers) + " player" + (numberOfPlayers>1 ? "s" : "")
        alivePlayers = numberOfPlayers
        numberOfJokers = Int(numberOfJokersStepper.value)
        numberOfJokersLabel.text = String(numberOfJokers) + " joker" + (numberOfJokers>1 ? "s" : "")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func sliderValueChanged(_ sender: UISlider) {
        numberOfPlayers = Int(numberOfPlayersStepper.value)
        numberOfPlayersLabel.text = String(numberOfPlayers) + " player(s)"
        alivePlayers = numberOfPlayers
    }*/
    @IBAction func playersStepperValueChanged(_ sender: UIStepper) {
        numberOfPlayers = Int(numberOfPlayersStepper.value)
        numberOfPlayersLabel.text = String(numberOfPlayers) + " player" + (numberOfPlayers>1 ? "s" : "")
        alivePlayers = numberOfPlayers
    }
    @IBAction func jokersStepperValueChanged(_ sender: UIStepper) {
        numberOfJokers = Int(numberOfJokersStepper.value)
        numberOfJokersLabel.text = String(numberOfJokers) + " joker" + (numberOfJokers>1 ? "s" : "")
    }
    
    @IBAction func next(_ sender: UIButton) {
        if(numberOfPlayers == 1){
            performSegue(withIdentifier: "onePlayerMode", sender: self)
            
        }
        else{
            performSegue(withIdentifier: "Create_New_Player", sender: self)
        }
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
