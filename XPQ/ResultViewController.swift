//
//  ResultViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/01/31.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    
    @IBOutlet var coinLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var coins: Int!
    var score: Int!
    var result: String!
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        coinLabel.text = String(coins)
        scoreLabel.text = String(score)
        
        fileNameArray = ["madamadane", "mousukosi", "syuryo", "yoxsya"]
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[2], ofType: "mp3")!)
        do{
            audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer.prepareToPlay()
        }
        
        audioPlayer.play()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Back() {
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        print("Back!")
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
