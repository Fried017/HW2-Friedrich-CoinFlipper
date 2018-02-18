//
//  ViewController.swift
//  coinFlip
//
//  Created by Ben Friedrich on 2/17/18.
//  Copyright © 2018 Ben Friedrich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet var coins: [UIButton]!
    @IBOutlet weak var labelResults: UILabel!
    
    var heads = UIImage(named: "coinHeads")
    var tails = UIImage(named: "coiTail")
    
    enum CoinsFlipped{
        case zero
        case one
        case two
    }
    var coinsFlipped = CoinsFlipped.zero;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func checkFinish(){
        
        switch(coinsFlipped)
        {
        case .zero:
            coinsFlipped = CoinsFlipped.one
            break;
        case .one:
            coinsFlipped = CoinsFlipped.two
            break;
        case .two:
            checkWin()
            break;
        }
    }
    
    func checkWin()
    {
        var allHeads = true
        var allTails = true
        
        for UIButton in coins
        {
            if(UIButton.currentImage?.isEqual(UIImage(named: "coinHeads")))!
            { allTails = false}
            else
            { allHeads = false}
        }
        
        if(allHeads || allTails)
        {
            labelResults.text="WINNER"
        }
        else{
            labelResults.text="LOSER"
        }
    }
    
    func flipCoin(i:Int){
        //if(i >= coins.count){
        //    return;
        //}
        
        // Check if heads or tails
        if(arc4random_uniform(2)==0){
            coins[i].setImage(UIImage(named: "coinHeads"), for: .normal);
        }
        else{
            coins[i].setImage(UIImage(named: "coinTails"), for: .normal);
        }
        checkFinish();
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
            coinsFlipped = CoinsFlipped.zero
            for UIButton in coins{
                UIButton.setImage(UIImage(named: "coinUnknown"), for: .normal)
            }
        labelResults.text=""
    }
    
    @IBAction func coinAPressed(_ sender: UIButton) {
        if(coins[0].currentImage?.isEqual(UIImage(named:"coinUnknown")))!
        {
            flipCoin(i:0);
        }
    }
    
    @IBAction func coinBPressed(_ sender: UIButton) {
        if(coins[1].currentImage?.isEqual(UIImage(named:"coinUnknown")))!
        {
            flipCoin(i:1);
        }
    }
    
    @IBAction func coinCPressed(_ sender: UIButton) {
        if(coins[2].currentImage?.isEqual(UIImage(named:"coinUnknown")))!
        {
            flipCoin(i:2);
        }
    }
    
    
}

