//
//  SinglePlayerViewController.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 24..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class SinglePlayerViewController: UIViewController {
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
    var remainingNormalCards = 0
    
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
        remainingNormalCards = numberOfCards - numberOfJokers
        scoreLabel.text = String(score)
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
            if(!(tableCards[position].image==UIImage(named:"rsz_red_joker"))){
                remainingNormalCards-=1
                if(remainingNormalCards==0){
                    score+=(score/2)+(10*numberOfJokers)
                    performSegue(withIdentifier: "continue_Singlegame", sender: self)
                    return
                }
                else{
                    score+=(score*numberOfJokers)/2 + numberOfJokers
                }
                scoreLabel.text = String(score)
            }
            else{
                showJokers()
                performSegue(withIdentifier: "GameOver", sender: self)
            }
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
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

