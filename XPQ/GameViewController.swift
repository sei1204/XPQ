//
//  GameViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/01/31.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController, UITextFieldDelegate {
    
    //コインとスコアの変数
    var coins: Int = 0
    var score: Int = 0
    var nokorimondai: Int!
    var seikaisu: Int = 0
    var nokorijikan: Int!
    
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
    var mondaiArray:[String] = ["Xcodeの言語「Swift』はいつ発表されたか?(年、月、日)","Swiftでの変数提供のプログラムを書きなさい（変数名はnumber、型はInt、値は指定しなくて良い）","Swiftの意味を書きなさい","Swiftでのlabelの部品提供のプログラムを書きなさい。（名前はlabel）","クラスとは何？","乱数を発生させるプログラムを書きなさい。(乱数名はransu)（型変換も）","コンソールに結果を出力したい時、print文とあともう一つは？","プログラムで数はどこから数え始める？","実機でテストする時、必要なプログラムは？","Xcodeで推奨している書き方をなんという？","変数とは何か？次の二つから記号で選べ(A:常に値が変わる数  B: 値が決まっている数)","/の逆は何？(カタカナ8文字)","繰り返し処理をする文を英語で2つ挙げなさい。","trueを訳すと何？","falseを訳すと何？","整数の型は？","小数の型は？","文字列の型は？","0と1を判断する型は？","複数データを扱うために必要な物を3つ答えて(アルファベット順)","アプリの起動画面はどこ？","プログラムと部品を結びつける作業をなんというか？","Swift2になって、新しくできたオプショナル型の命令文は？","UILabelなどのUIとは何？(英語で)","Arrayは何で指定する？","Dictionaryは何で指定する？","TextFieldを使うとき最初のclassというところに何と記述する？","*はどういうときに使うか","Swiftで割り算の記号は？","配列の『添え字』は英語で何という？"]
    
    //答え配列
    var kotaeArray:[String] = ["2014年6月2日","var number: Int!","アマツバメ","@IBOutlet var label: UIlabel!","オブジェクトの設計図","arc4random_uniform","NSLog","0","Apple Developer program","キャメルケース","A","バックスラッシュ","while,for","真","偽","Int","Double","String","Bool","Array,Dictionary,Tuple","LaunchScreen.storyboard","関連付け","guard","UserInterface","番号","文字列","UITextFieldDelegate","掛け算","/","index"]
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    
    
    //添え字をゼロに
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nokorijikan = 120
        nokorimondai = 30
        
        kotaeTextField.delegate = self
        
        
        nokorijikantimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(GameViewController.down), userInfo: nil, repeats: true)
        print("start!")
        nokorijikanLabel.text = String(nokorijikan)
        mondaiTextView.text = mondaiArray[index]
    }
    
    func down() {
        nokorijikan =  nokorijikan - 1
        nokorijikanLabel.text = String(nokorijikan)
        //nokorizikantimerの値が0になったら次の画面へ行く
        if nokorijikan == 0 {
            self.performSegueToResult()
            print("GAMEOVER..")
            nokorijikantimer.invalidate()
        }
        
        //fileNameArrayに曲のファイル名を入れていく
        fileNameArray = ["不正解音", "金"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hantei() {
        
        hantei(kotaeTextField.text!, mondaiNum: index)
        
        //indexの値を+1する
        index = index + 1
        print(index)
        
        
        //残り問題を-1する
        nokorimondai = nokorimondai - 1
        nokorimondaiLabel.text = String(nokorimondai)
        print(nokorimondai)
        
        //indexの値が10になったら次の画面へ行く
        if index < 30 {
            mondaiTextView.text = mondaiArray[index]
        }else {
            self.performSegueToResult()
            print("stop!")
            nokorijikantimer.invalidate()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        
        return true
        
    }
    
    func hantei(userkaito: String, mondaiNum: Int) {
        if userkaito == kotaeArray[mondaiNum] {
            resultLabel.text = "正解！"
            seikaisu = seikaisu + 1
            
            //コインを1個増やす
            coins = coins + 1
            coinLabel.text = String(coins)
            print(coins)
            
            
            //スコアを1増やす
            score = score + 1
            scoreLabel.text = String(score)
            print(score)
            
            
            let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[1], ofType: "mp3")!)
            do{
                audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
                audioPlayer.prepareToPlay()
            }
            
            audioPlayer.play()
            
        }else{
            resultLabel.text = "不正解！"
            let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[0], ofType: "mp3")!)
            do{
                audioPlayer = try! AVAudioPlayer(contentsOfURL: audioPath)
                audioPlayer.prepareToPlay()
            }
            
            audioPlayer.play()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let resultViewController = segue.destinationViewController as! ResultViewController
        
        resultViewController.coins = self.coins
        resultViewController.score = self.score
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