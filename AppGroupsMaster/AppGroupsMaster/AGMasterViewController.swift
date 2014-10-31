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
  
  struct Constants {
    static let AppGroupName = "group.com.isobar.AppGroupsDemo"
    static let FileName = "image01.png"
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  func saveShareFile(fileName:NSString, image:UIImage) -> Bool {
    var storeURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupName)
    storeURL = storeURL?.URLByAppendingPathComponent(fileName)
    println("storeURL:\(storeURL)")
    let imageData = UIImagePNGRepresentation(image)
    let result = imageData.writeToURL(storeURL!, atomically: true)
    return result
  }
  
  func snapshot(view: UIView) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
    view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  @IBAction func saveClicked(sender: AnyObject) {
    println("save clicked: \(textFieldForInput.text)")
    var myShareDefaults = NSUserDefaults(suiteName: Constants.AppGroupName)
    if let passData = textFieldForInput.text {
      myShareDefaults?.setValue(passData, forKey: "PassData")
      textViewForLog.text = textViewForLog.text + "Add:" + textFieldForInput.text + "\n"
      myShareDefaults?.synchronize()
    }
    
    if (saveShareFile(Constants.FileName, image: snapshot(self.view))) {
      println("Success")
    }
    else {
      println("Failure")
    }
  }
  
  @IBAction func showClicked(sender: AnyObject) {
    var myShareDefaults = NSUserDefaults(suiteName: Constants.AppGroupName)
    if let stringInput = myShareDefaults?.stringForKey("PassData") {
      textViewForLog.text = textViewForLog.text + "Result:" + stringInput + "\n"
    }

  }

}
