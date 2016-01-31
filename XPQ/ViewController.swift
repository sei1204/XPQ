//
//  ViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/01/17.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var yellowSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var blackSwitch: UISwitch!
    @IBOutlet weak var whiteSwitch: UISwitch!
    
    @IBOutlet var aboutXcodeButton: UIButton!
    @IBOutlet var languageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        redSwitch.on = false
        yellowSwitch.on = false
        greenSwitch.on = false
        blueSwitch.on = false
        blackSwitch.on = false
        whiteSwitch.on = false
        
    }
     
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redOn() {
        view.backgroundColor = UIColor.redColor()
        
    }
    
    @IBAction func yellowOn() {
        view.backgroundColor = UIColor.yellowColor()
        
    }
    
    @IBAction func greenOn() {
        view.backgroundColor = UIColor.greenColor()
        
    }
    
    @IBAction func blueOn() {
        view.backgroundColor = UIColor.blueColor()
        
    }
    
    @IBAction func blackOn() {
        view.backgroundColor = UIColor.blackColor()
        
    }
    
    @IBAction func whiteOn() {
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
}

