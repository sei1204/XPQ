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
    @IBOutlet var coinsResultLabel: UILabel!
    @IBOutlet var scoreResultLabel: UILabel!
    
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
        
        coinsResultLabel.text = self.coinsHantei(coins)
        scoreResultLabel.text = self.scoreHantei(score)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func coinsHantei(coins: Int) -> String {
        if coins > 28 && coins < 30 {
            return "いいねぇ〜( ^ω^ )"
        }else if coins > 25 && coins < 27 {
            return "後もう少し！(´Д` )"
        }else if coins > 22 && coins < 24 {
            return "まだまだだね！( *｀ω´)"
        }else {
            return "もう少し勉強してね(T ^ T)"
        }
    }
    
    func scoreHantei(score: Int) -> String {
        if score > 28 && score < 30 {
            return "いいねぇ〜( ^ω^ )"
        }else if score > 25 && score < 27 {
            return "後もう少し！(´Д` )"
        }else if score > 22 && score < 24 {
            return "まだまだだね！( *｀ω´)"
        }else {
            return "もう少し勉強してね(T ^ T)"
        }
        
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
