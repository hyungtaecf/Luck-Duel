//
//  TwoPlayer.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 5..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class ManyPlayersViewController: UIViewController {
    @IBOutlet var player1Avatar: UIImageView!
    @IBOutlet var player2Avatar: UIImageView!
    @IBOutlet var player3Avatar: UIImageView!
    @IBOutlet var player4Avatar: UIImageView!
    @IBOutlet var player5Avatar: UIImageView!
    @IBOutlet var player1Turn: UIImageView!
    @IBOutlet var player2Turn: UIImageView!
    @IBOutlet var player3Turn: UIImageView!
    @IBOutlet var player4Turn: UIImageView!
    @IBOutlet var player5Turn: UIImageView!
    @IBOutlet var cardA: UIButton!
    @IBOutlet var cardB: UIButton!
    @IBOutlet var cardC: UIButton!
    @IBOutlet var cardD: UIButton!
    @IBOutlet var cardE: UIButton!
    @IBOutlet var cardF: UIButton!
    @IBOutlet var cardG: UIButton!
    @IBOutlet var cardH: UIButton!
    @IBOutlet var cardI: UIButton!
    @IBOutlet var cardJ: UIButton!
    @IBOutlet var cardK: UIButton!
    @IBOutlet var cardL: UIButton!
    var tableCards = Array<Card>()
    var faceUpJokers = 0
    let numberOfCards = 12
    
    func getCardButton(_ x: Int) -> UIButton! {
        switch(x){
        case 0: return cardA;
        case 1: return cardB;
        case 2: return cardC;
        case 3: return cardD;
        case 4: return cardE;
        case 5: return cardF;
        case 6: return cardG;
        case 7: return cardH;
        case 8: return cardI;
        case 9: return cardJ;
        case 10: return cardK;
        case 11: return cardL;
        default:
            print("error");
            return cardA;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        var deck = Array<Int>()
        player1Avatar.image = playerList[0].image
        if(playerList[0].eliminated){
            player1Turn.layer.zPosition = 10
            player1Turn.image = UIImage(named: "x_icon")
        }
        else{
            player1Turn.layer.zPosition = -10
            player1Turn.image = UIImage(named: "rsz_black")
        }
        player2Avatar.image = playerList[1].image
        if(playerList[1].eliminated){
            player2Turn.layer.zPosition = 10
            player2Turn.image = UIImage(named: "x_icon")
        }
        else{
            player2Turn.layer.zPosition = -10
            player2Turn.image = UIImage(named: "rsz_black")
        }
        if(numberOfPlayers>2){
            player3Avatar.image = playerList[2].image
            if(playerList[2].eliminated){
                player3Turn.layer.zPosition = 10
                player3Turn.image = UIImage(named: "x_icon")
            }
            else{
                player3Turn.layer.zPosition = -10
                player3Turn.image = UIImage(named: "rsz_black")
            }
        }
        else{
            player3Avatar.image = UIImage(named:"rsz_black")
            player3Turn.image = UIImage(named: "rsz_black")
        }
        if(numberOfPlayers>3){
            player4Avatar.image = playerList[3].image
            if(playerList[3].eliminated){
                player4Turn.layer.zPosition = 10
                player4Turn.image = UIImage(named: "x_icon")
            }
            else{
                player4Turn.layer.zPosition = -10
                player4Turn.image = UIImage(named: "rsz_black")
            }
        }
        else{
            player4Avatar.image = UIImage(named:"rsz_black")
            player4Turn.image = UIImage(named: "rsz_black")
        }
        if(numberOfPlayers>4){
            player5Avatar.image = playerList[4].image
            if(playerList[4].eliminated){
                player5Turn.layer.zPosition = 10
                player5Turn.image = UIImage(named: "x_icon")
            }
            else{
                player5Turn.layer.zPosition = -10
                player5Turn.image = UIImage(named: "rsz_black")
            }
        }
        else{
            player5Avatar.image = UIImage(named:"rsz_black")
            player5Turn.image = UIImage(named: "rsz_black")
        }
        switch(playerTurn){
        case 0: player1Turn.image = UIImage(named: "rsz_wac_8479")
        case 1: player2Turn.image = UIImage(named: "rsz_wac_8479")
        case 2: player3Turn.image = UIImage(named: "rsz_wac_8479")
        case 3: player4Turn.image = UIImage(named: "rsz_wac_8479")
        case 4: player5Turn.image = UIImage(named: "rsz_wac_8479")
        default: print("PLAYER'S TURN ERROR")
        }
        while(deck.count<numberOfCards){
            let x = Int(arc4random()%52)
            if(!deck.contains(x)){
                tableCards.append(Card(UIImage(named: getCardNameByNumber(x)), getCardButton(deck.count)))
                deck.append(x)
            }
        }
        deck.removeAll()
        while(deck.count<numberOfJokers){
            let x = Int(arc4random()%UInt32(numberOfCards))
            if(!deck.contains(x)){
                tableCards[x].setImage(UIImage(named:"rsz_red_joker"))
                deck.append(x)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        usleep(1000000)
    }
    func clickedCard(_ position: Int){
        if(!tableCards[position].isFaceUp()){
            tableCards[position].faceUp()
            if(tableCards[position].image==UIImage(named:"rsz_red_joker")){
                faceUpJokers+=1
                playerList[playerTurn].eliminated = true
                switch(playerTurn){
                case 0:
                    player1Turn.layer.zPosition = 10
                    player1Turn.image = UIImage(named: "x_icon")
                case 1:
                    player2Turn.layer.zPosition = 10
                    player2Turn.image = UIImage(named: "x_icon")
                case 2:
                    player3Turn.layer.zPosition = 10
                    player3Turn.image = UIImage(named: "x_icon")
                case 3:
                    player4Turn.layer.zPosition = 10
                    player4Turn.image = UIImage(named: "x_icon")
                case 4:
                    player5Turn.layer.zPosition = 10
                    player5Turn.image = UIImage(named: "x_icon")
                default: print("ELIMINATION ERROR")
                }
                alivePlayers-=1
                if(alivePlayers==1){
                    showJokers()
                    performSegue(withIdentifier: "GameOver_ManyPlayers", sender: self)
                    return
                }
                else if(faceUpJokers==numberOfJokers){
                    changeTurn()
                    showJokers()
                    performSegue(withIdentifier: "continue_game", sender: self)
                    return
                }
            }
            changeTurn()
        }
    }
    func showJokers(){
        for x in 0 ..< numberOfCards {
            if(tableCards[x].image==UIImage(named:"rsz_red_joker")){
                getCardButton(x).setImage(UIImage(named:"rsz_red_joker"), for: .normal)
            }
            else{
                getCardButton(x).setImage(UIImage(named:"black_joker"), for: .normal)
            }
        }
    }
    func changeTurn(){
        if(!playerList[playerTurn].eliminated){
            switch(playerTurn){
            case 0: player1Turn.image = UIImage(named: "rsz_black")
            case 1: player2Turn.image = UIImage(named: "rsz_black")
            case 2: player3Turn.image = UIImage(named: "rsz_black")
            case 3: player4Turn.image = UIImage(named: "rsz_black")
            case 4: player5Turn.image = UIImage(named: "rsz_black")
            default: print("CHANGE TURN ERROR 1")
            }
        }
        repeat{
            playerTurn+=1
            if(playerTurn>numberOfPlayers-1){
                playerTurn = 0
            }
        }while(playerList[playerTurn].eliminated)
        switch(playerTurn){
        case 0: player1Turn.image = UIImage(named: "rsz_wac_8479")
        case 1: player2Turn.image = UIImage(named: "rsz_wac_8479")
        case 2: player3Turn.image = UIImage(named: "rsz_wac_8479")
        case 3: player4Turn.image = UIImage(named: "rsz_wac_8479")
        case 4: player5Turn.image = UIImage(named: "rsz_wac_8479")
        default: print("CHANGE TURN ERROR 2")
        }
    }
    @IBAction func clickedA(_ sender: UIButton) {
        clickedCard(0)
    }
    @IBAction func clickedB(_ sender: UIButton) {
        clickedCard(1)
    }
    @IBAction func clickedC(_ sender: UIButton) {
        clickedCard(2)
    }
    @IBAction func clickedD(_ sender: UIButton) {
        clickedCard(3)
    }
    @IBAction func clickedE(_ sender: UIButton) {
        clickedCard(4)
    }
    @IBAction func clickedF(_ sender: UIButton) {
        clickedCard(5)
    }
    @IBAction func clickedG(_ sender: UIButton) {
        clickedCard(6)
    }
    @IBAction func clickedH(_ sender: UIButton) {
        clickedCard(7)
    }
    @IBAction func clickedI(_ sender: UIButton) {
        clickedCard(8)
    }
    @IBAction func clickedJ(_ sender: UIButton) {
        clickedCard(9)
    }
    @IBAction func clickedK(_ sender: UIButton) {
        clickedCard(10)
    }
    @IBAction func clickedL(_ sender: UIButton) {
        clickedCard(11)
    }
    @IBAction func quit(_ sender: UIButton) {
        playerList.removeAll()
        numberOfPlayers = 0
        playerList = Array<Player>()
        createdPlayers = 0
        alivePlayers = 0
        playerTurn = 0
        numberOfJokers = 1
        performSegue(withIdentifier: "End", sender: self)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func _quit(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "End", sender: self)
    }
    
}

