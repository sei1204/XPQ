//
//  GameViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/01/31.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    //コインとスコアの変数
    var coins: Int = 0
    var score: Int = 0
    var nokorimondai: Int = 0
    var seikaisu: Int = 0
    var nokorijikan: Int = 0
    
    var nokorijikantimer = NSTimer()
    
    
    //部品提供
    @IBOutlet var hanteiButton: UIButton!
    
    @IBOutlet var coinLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var nokorimondaiLabel: UILabel!
    @IBOutlet var nokorijikanLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var mondaiTextView: UITextView!
    
    @IBOutlet var kotaeTextField: UITextField!
    
    
    //問題配列
    var mondaiArray:[String] = ["Xcodeの言語「Swift』はいつ発表されたか?","Swiftでの変数提供のプログラムを書きなさい（変数名はnumber)(型はInt)","Swiftの意味を書きなさい","Swiftでのlabelの部品提供のプログラムを書きなさい。（名前はlabel）","クラスとは何？","乱数を発生させるプログラムを書きなさい。(乱数名はransu)（型変換も）","コンソールに結果を出力したい時、print文とあともう一つは？","プログラムで数はどこから数え始める？","実機でテストする時、必要なプログラムは？","Xcodeでの名前の書き方をなんという？"]
    
    //答え配列
    var kotaeArray:[String] = ["２０１４年６月２日","var number: Int = 0","アマツバメ","@IBOutlet var label: UIlabel!","オブジェクトの設計図","arc4random_uniform","NSLog","０","Apple Developer program","キャメルケース"]
    
    //添え字をゼロに
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        kotaeTextField.delegate = self
        
        if !nokorijikantimer.valid {
            nokorijikantimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("down"), userInfo: nil, repeats: true)
            
            print("start!")
        }
        nokorijikan = 60
        nokorijikanLabel.text = String(nokorijikan)
    }
    
    func down() {
        nokorijikan =  nokorijikan - 1
        nokorijikanLabel.text = String(nokorijikan)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hantei() {
        //配列の要素を追加していく
        mondaiTextView.text = mondaiArray[index]
        
        //正解かどうか判定する
        
        
        //indexの値を+1する
        index = index + 1
        print("plus_1!")
        
        //値が9より多くなったら次の画面へ行く
        if index > 9 {
            self.performSegueToResult()
            print("stop!")
            nokorijikantimer.invalidate()
            nokorijikan = 60
            nokorijikanLabel.text = String(nokorijikan)
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
