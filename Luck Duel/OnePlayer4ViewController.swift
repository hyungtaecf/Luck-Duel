//
//  TwoPlayer.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 5..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class OnePlayer4ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var cardA: UIButton!
    @IBOutlet var cardB: UIButton!
    @IBOutlet var cardC: UIButton!
    @IBOutlet var cardD: UIButton!
    var tableCards = Array<Card>()
    let numberOfCards = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        scoreLabel.text=String(score)
        var deck = Array<Int>()
        func getCardButton() -> UIButton! {
            switch(deck.count){
            case 0: return cardA;
            case 1: return cardB;
            case 2: return cardC;
            case 3: return cardD;
            default:
                print("error");
                return cardA;
            }
        }
        while(deck.count<numberOfCards){
            let x = Int(arc4random()%13)
            if(!deck.contains(x)){
                switch(x){
                case 0:
                    tableCards.append(Card(UIImage(named: "rsz_k"), getCardButton()))
                case 1:
                    tableCards.append(Card(UIImage(named: "rsz_a"), getCardButton()))
                case 2:
                    tableCards.append(Card(UIImage(named: "rsz_2"), getCardButton()))
                case 3:
                    tableCards.append(Card(UIImage(named: "rsz_3"), getCardButton()))
                case 4:
                    tableCards.append(Card(UIImage(named: "rsz_4"), getCardButton()))
                case 5:
                    tableCards.append(Card(UIImage(named: "rsz_5"), getCardButton()))
                case 6:
                    tableCards.append(Card(UIImage(named: "rsz_6"), getCardButton()))
                case 7:
                    tableCards.append(Card(UIImage(named: "rsz_7"), getCardButton()))
                case 8:
                    tableCards.append(Card(UIImage(named: "rsz_8"), getCardButton()))
                case 9:
                    tableCards.append(Card(UIImage(named: "rsz_9"), getCardButton()))
                case 10:
                    tableCards.append(Card(UIImage(named: "rsz_10"), getCardButton()))
                case 11:
                    tableCards.append(Card(UIImage(named: "rsz_j"), getCardButton()))
                case 12:
                    tableCards.append(Card(UIImage(named: "rsz_q"), getCardButton()))
                    
                default:print("ERROR");
                }
                deck.append(x)
            }
            // Do any additional setup after loading the view.
        }
        tableCards[Int(arc4random()%12)].setImage(UIImage(named:"rsz_red_joker"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func clickedCard(_ position: Int){
        if(!tableCards[position].isFaceUp()){
            tableCards[position].faceUp()
            if(tableCards[position].image==UIImage(named:"rsz_red_joker")){
                performSegue(withIdentifier: "One_Player_5", sender: self)
            }
            score+=1
            scoreLabel.text=String(score)
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


