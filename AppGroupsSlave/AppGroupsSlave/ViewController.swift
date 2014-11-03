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
  @IBOutlet weak var imageView: UIImageView!
  
  struct Constants {
    static let AppGroupName = "group.com.isobar.AppGroupsDemo"
    static let FileName = "image01.png"
    static let FileNameForPicker = "image02.png"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func loadShareFile(fileName:NSString) -> UIImage? {
    let containerURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupName)
    let loadURL = containerURL?.path?.stringByAppendingPathComponent(fileName)
    if let image = UIImage(contentsOfFile: loadURL!) {
      return image
    }
    return nil
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showClicked(sender: AnyObject) {
    var myShareDefaults = NSUserDefaults(suiteName: Constants.AppGroupName)
    if let passData = myShareDefaults?.stringForKey("PassData") {
      textViewForLog.text = textViewForLog.text + passData + "\n"
    }
    if let sharedImage = loadShareFile(Constants.FileName) as UIImage? {
      imageView.image = sharedImage
    }
  }

}

