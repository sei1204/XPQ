//
//  Xcode_Setumei_ViewController.swift
//  XPQ
//
//  Created by 三城聖 on 2016/02/16.
//  Copyright © 2016年 三城聖. All rights reserved.
//

import UIKit

class Xcode_Setumei_ViewController: UIViewController {
    
    @IBOutlet var setumeiTextView: UITextView!
    @IBOutlet var modoruButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
