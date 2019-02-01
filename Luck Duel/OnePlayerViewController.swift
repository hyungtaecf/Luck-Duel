//
//  TwoPlayer.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 5..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

var score = 0
class OnePlayerViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
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
    let numberOfCards = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        score = 0
        scoreLabel.text=String(score)
        var deck = Array<Int>()
        func getCardButton() -> UIButton! {
            switch(deck.count){
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
        while(deck.count<numberOfCards){
            let x = Int(arc4random()%52)
            if(!deck.contains(x)){
                tableCards.append(Card(UIImage(named: getCardNameByNumber(x)), getCardButton()))
                deck.append(x)
            }
            // Do any additional setup after loading the view.
        }
        tableCards[Int(arc4random()%12)].setImage(UIImage(named:"rsz_red_joker"))
    }
    
    func clickedCard(_ position: Int){
        if(!tableCards[position].isFaceUp()){
            tableCards[position].faceUp()
            if(tableCards[position].image==UIImage(named:"rsz_red_joker")){
                performSegue(withIdentifier: "One_Player_2", sender: self)
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
