//
//  quizScreenController.swift
//  Social Joy
//
//  Created by Addison G Hodges on 5/1/18.
//  Copyright © 2018 Cohen, Trevor (Genworth). All rights reserved.
//


import MultipeerConnectivity
import UIKit

class quizScreenController: UIViewController {
    
    
    var browser: MCBrowserViewController!
    var session: MCSession!
    var peerID: MCPeerID!
    var currentPlayer : Player!
    
    
    
//    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    var timerIsRunning = false
    var seconds = 20
    
    
    
//    @IBOutlet weak var questionLabel: UILabel!
//
//    @IBOutlet weak var choiceA: UIButton!
//    @IBOutlet weak var choiceB: UIButton!
//    @IBOutlet weak var choiceC: UIButton!
//    @IBOutlet weak var choiceD: UIButton!
//
//    @IBOutlet weak var playerOneScore: UILabel!
//    @IBOutlet weak var playerTwoScore: UILabel!
//    @IBOutlet weak var playerThreeScore: UILabel!
//    @IBOutlet weak var playerFourScore: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var player3Score: UILabel!
    @IBOutlet weak var player4Score: UILabel!
    
    
    
    
    
    //var playerAnswer = String()
    
    
    
//    @IBAction func choiceASelect(_ sender: Any) {
//        choiceA.backgroundColor = UIColor.blue
//        choiceB.backgroundColor = UIColor.gray
//        choiceC.backgroundColor = UIColor.gray
//        choiceD.backgroundColor = UIColor.gray
//
//        currentPlayer.playerAnswer = "A"
//
//    }
    
    @IBAction func choiceASelect(_ sender: Any) {
                choiceA.backgroundColor = UIColor.blue
                choiceB.backgroundColor = UIColor.gray
                choiceC.backgroundColor = UIColor.gray
                choiceD.backgroundColor = UIColor.gray
        
                currentPlayer.playerAnswer = "A"
    }
    
    
    
//    @IBAction func choiceBSelect(_ sender: Any) {
//        choiceB.backgroundColor = UIColor.blue
//        choiceA.backgroundColor = UIColor.gray
//        choiceC.backgroundColor = UIColor.gray
//        choiceD.backgroundColor = UIColor.gray
//
//        currentPlayer.playerAnswer = "B"
//    }
    
    @IBAction func choiceBSelect(_ sender: Any) {
        choiceB.backgroundColor = UIColor.blue
        choiceA.backgroundColor = UIColor.gray
        choiceC.backgroundColor = UIColor.gray
        choiceD.backgroundColor = UIColor.gray
        
        currentPlayer.playerAnswer = "B"

    }
    
//
//    @IBAction func choiceCSelect(_ sender: Any) {
//        choiceC.backgroundColor = UIColor.blue
//        choiceA.backgroundColor = UIColor.gray
//        choiceB.backgroundColor = UIColor.gray
//        choiceD.backgroundColor = UIColor.gray
//
//        currentPlayer.playerAnswer = "C"
//
//    }
    
    @IBAction func choiceCSelect(_ sender: Any) {
        choiceC.backgroundColor = UIColor.blue
        choiceA.backgroundColor = UIColor.gray
        choiceB.backgroundColor = UIColor.gray
        choiceD.backgroundColor = UIColor.gray
        
        currentPlayer.playerAnswer = "C"

    }
    
//
//    @IBAction func choiceDSelect(_ sender: Any) {
//        choiceD.backgroundColor = UIColor.blue
//        choiceA.backgroundColor = UIColor.gray
//        choiceB.backgroundColor = UIColor.gray
//        choiceC.backgroundColor = UIColor.gray
//
//        currentPlayer.playerAnswer = "D"
//
//    }
    
    @IBAction func choiceDSelect(_ sender: Any) {
        choiceD.backgroundColor = UIColor.blue
        choiceA.backgroundColor = UIColor.gray
        choiceB.backgroundColor = UIColor.gray
        choiceC.backgroundColor = UIColor.gray
        
        currentPlayer.playerAnswer = "D"

        
    }
    
    
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(quizScreenController.updateTheTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTheTimer()
    {
        seconds = seconds - 1
        timeLabel.text = "\(seconds)"
        
        if seconds == 0
        {
            timer.invalidate()
            
            endQuestion()
        }
    }
    
    func endQuestion()
    {
        //This is where you would change the questionLabel.text = the answer to the question. Then award points to correct players by changing the playerOneScore.text = playerOneScore (and so on).
        //Then goToNextQuestion()
    }
    
    func awardPoints()
    {
        //If playerAnswer == correctAnswer, chance corresponding player text label to player score + 1
        //change timer Label to either correct or incorrect
        
        if currentPlayer.playerAnswer == "A"
        {
            questionLabel.text = "Correct!"
            
        }
        else if currentPlayer.playerAnswer == "B"
        {
            questionLabel.text = "Incorrect"
        }
        
    }
    
    func goToNextQuestion()
    {
        //Reset Question Label to current question
        //Reset correctAnswer
        //Reset playerAnswer
        //Reset timer to 20 seconds
        //Reset choices background colors all to gray
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        
        
        //The currentPlayer is the peerID that is equal to an object in thePlayers
        //Throwing SIGBAT error because if theres only 2 players, there no thePlayers object data at 2 or 3 (3 or 4 players)
        //Could fix by
        
        if peerID == thePlayers[0].peerID
        {
            currentPlayer = thePlayers[0]
        }
        else if thePlayers.count >= 1 && peerID == thePlayers[1].peerID
        {
            currentPlayer = thePlayers[1]
        }
//        else if thePlayers.count >= 2 && peerID == thePlayers[2].peerID
//        {
//            currentPlayer = thePlayers[2]
//        }
//        else if thePlayers.count >= 3 && peerID == thePlayers[3].peerID
//        {
//            currentPlayer = thePlayers[3]
//        }
        
        
        startTimer()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

