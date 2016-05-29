//
//  ThisAppSetsumeiViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/03/06.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit
import AVFoundation

class ThisAppSetsumeiViewController: UIViewController {
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //fileNameArrayに曲のファイル名を入れていく
        fileNameArray = ["不正解音", "金"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func Back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func seikaion() {
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[1], ofType: "mp3")!)
        do{
            audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer.prepareToPlay()
        }
        audioPlayer.play()
    }
    
    @IBAction func huseikaion() {
        
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[0], ofType: "mp3")!)
        do{
            audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
            audioPlayer.prepareToPlay()
        }
        audioPlayer.play()
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
