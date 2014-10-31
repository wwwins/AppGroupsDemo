//
//  AGMasterViewController.swift
//  AppGroupsMaster
//
//  Created by wwwins on 2014/10/30.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class AGMasterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  @IBOutlet weak var textFieldForInput: UITextField!
  @IBOutlet weak var buttonForShow: UIButton!
  @IBOutlet weak var buttonForSave: UIButton!
  @IBOutlet weak var textViewForLog: UITextView!
  
  struct Constants {
    static let AppGroupName = "group.com.isobar.AppGroupsDemo"
    static let FileName = "image01.png"
  }
  
  var imagePickerController:UIImagePickerController!
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  // MARK:- Image picker controller

  func isCameraAvailable() -> Bool {
    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
      return true
    }
    return false
  }
  
  func initImagePickerController() {
    if isCameraAvailable() {
      if ((imagePickerController) == nil) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera)!
      }
    }
  }
  
  // MARK:- Save a shared file
  
  func saveShareFile(fileName:NSString, image:UIImage) -> Bool {
    var storeURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(Constants.AppGroupName)
    storeURL = storeURL?.URLByAppendingPathComponent(fileName)
    println("storeURL:\(storeURL)")
    let imageData = UIImagePNGRepresentation(image)
    let result = imageData.writeToURL(storeURL!, atomically: true)
    return result
  }
  
  // MARK:- Snapshot
  
  func snapshot(view: UIView) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
    view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

  // MARK:- Actions
  
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
  
  @IBAction func captureClicked(sender: AnyObject) {
    println("Capture")
    initImagePickerController()
    
  }

}
