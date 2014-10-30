//
//  AGMasterViewController.swift
//  AppGroupsMaster
//
//  Created by wwwins on 2014/10/30.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class AGMasterViewController: UIViewController {

  @IBOutlet weak var textFieldForInput: UITextField!
  @IBOutlet weak var buttonForShow: UIButton!
  @IBOutlet weak var buttonForSave: UIButton!
  @IBOutlet weak var textViewForLog: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  @IBAction func saveClicked(sender: AnyObject) {
    println("save clicked: \(textFieldForInput.text)")
    var myShareDefaults = NSUserDefaults(suiteName: "group.com.isobar.AppGroupsDemo")
    if let passData = textFieldForInput.text {
      myShareDefaults?.setValue(passData, forKey: "PassData")
      textViewForLog.text = textViewForLog.text + "Add:" + textFieldForInput.text + "\n"
      
    }
    
  }
  
  @IBAction func showClicked(sender: AnyObject) {
    var myShareDefaults = NSUserDefaults(suiteName: "group.com.isobar.AppGroupsDemo")
    if let stringInput = myShareDefaults?.stringForKey("PassData") {
      textViewForLog.text = textViewForLog.text + "Result:" + stringInput + "\n"
    }
  }

}
