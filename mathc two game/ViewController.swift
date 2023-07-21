//
//  ViewController.swift
//  mathc two game
//
//  Created by Kamila Sultanova on 17.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundPicture: UIImageView!
    
    var isGaming = false
    var count = 0
    var matches = 0
    var timer = Timer()

    
    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    //prepare win combinations
    var winState = [[0,6],[1,15],[2,5],[3,10],[14,7],[8,9],[11,13],[12,4]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func game(_ sender: UIButton) {
        
        
        
        
        if state[sender.tag - 1] != 0 || isGaming {
            return
        }
        
        //assigning background pics to button as per prepared winState
        switch sender.tag{
        case 1, 7:
            sender.setBackgroundImage(UIImage(named: "1"), for: .normal)
        case 2, 16:
            sender.setBackgroundImage(UIImage(named: "2"), for: .normal)
        case 3, 6:
            sender.setBackgroundImage(UIImage(named: "3"), for: .normal)
        case 4, 11:
            sender.setBackgroundImage(UIImage(named: "4"), for: .normal)
        case 5, 13:
            sender.setBackgroundImage(UIImage(named: "5"), for: .normal)
        case 9, 10:
            sender.setBackgroundImage(UIImage(named: "6"), for: .normal)
        case 12, 14:
            sender.setBackgroundImage(UIImage(named: "7"), for: .normal)
        case 8, 15:
            sender.setBackgroundImage(UIImage(named: "8"), for: .normal)
        default:
            print("You need to click a button")
        }
        //chaning the state from 0 to 1 for following check
        state[sender.tag - 1] = 1
        count += 1 //increase count according to number of picture open
        
        //checking if button pics are matching
        for wins in winState {
            if state[wins[0]] == 1 && state[wins[1]] == 1 {
                state[wins[0]] = 2
                state[wins[1]] = 2
                matches += 1
                count = 0
                print(state)
            }
        }
        
        //if we have 2 unmatch pics,we clear them with timer
        if count == 2 {
            isGaming = true
            _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.clear()
                self.isGaming = false

            }
        }
            
        print(matches)
        //if we reach all 8 matches we call an alert
        if matches == 8 {
            timer.invalidate()
            let alert = UIAlertController(title: "You win!", message: "Congratulations!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                UIAlertAction in
                self.clearAll()
            }))

            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    //if we have two unmatch pics, we delete pics,states and count of these two buttons
    @objc func clear(){
        for i in 0...15{
            if state[i] == 1{
                isGaming = false
                let button = view.viewWithTag(i+1) as! UIButton
                button.setBackgroundImage(nil, for: .normal)
                state[i] = 0
                count = 0
            }
        }
    }
    //if we reach all 8 matches we delete all button pics,states and count
    func clearAll(){
        for i in 0...15{
            isGaming = false
            let button = view.viewWithTag(i+1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            state[i] = 0
            count = 0
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
 
