//
//  ViewController.swift
//  AppGroupsSlave
//
//  Created by wwwins on 2014/10/30.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var buttonForShow: UIButton!
  @IBOutlet weak var textViewForLog: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showClicked(sender: AnyObject) {
    var myShareDefaults = NSUserDefaults(suiteName: "group.com.isobar.AppGroupsDemo")
    if let passData = myShareDefaults?.stringForKey("PassData") {
      textViewForLog.text = textViewForLog.text + passData + "\n"
    }
  }

}

