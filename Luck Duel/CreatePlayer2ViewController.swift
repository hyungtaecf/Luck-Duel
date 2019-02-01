//
//  CreatePlayer2ViewController.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 20..
//  Copyright © 2017년 606-15. All rights reserved.
//

import UIKit

class CreatePlayer2ViewController: UIViewController {

    @IBOutlet var typeNicknameLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var avatarSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        typeNicknameLabel.text = "Type the nickname for the player " + String(createdPlayers+1)
        if(createdPlayers >= numberOfPlayers){/*go to game screen*/}
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeImage(_ sender: UISlider) {
        switch(Int(sender.value)){
        case 0: avatarImage.image = UIImage(named:"avatar_00")
        case 1: avatarImage.image = UIImage(named:"avatar_01")
        case 2: avatarImage.image = UIImage(named:"avatar_02")
        case 3: avatarImage.image = UIImage(named:"avatar_03")
        case 4: avatarImage.image = UIImage(named:"avatar_04")
        case 5: avatarImage.image = UIImage(named:"avatar_05")
        case 6: avatarImage.image = UIImage(named:"avatar_06")
        case 7: avatarImage.image = UIImage(named:"avatar_07")
        case 8: avatarImage.image = UIImage(named:"avatar_08")
        case 9: avatarImage.image = UIImage(named:"avatar_09")
        case 10: avatarImage.image = UIImage(named:"avatar_10")
        case 11: avatarImage.image = UIImage(named:"avatar_11")
        case 12: avatarImage.image = UIImage(named:"avatar_12")
        case 13: avatarImage.image = UIImage(named:"avatar_13")
        default: avatarImage.image = UIImage(named:"avatar_11")
        }
    }
    @IBAction func next(_ sender: UIButton) {
        playerList.append(Player(nameTextField.text, avatarImage.image))
        createdPlayers+=1
        if(createdPlayers>=numberOfPlayers){
            performSegue(withIdentifier: "start_game", sender: self)
        }
        else{
            performSegue(withIdentifier: "Create_New_Player2", sender: self)
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
