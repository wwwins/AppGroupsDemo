//
//  ShowPhotoViewController.swift
//  AppGroupsSlave
//
//  Created by wwwins on 2014/11/3.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {

    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var imagePhotoView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      if let sharedImage = loadShareFile(ViewController.Constants.FileNameForPicker) as UIImage? {
        imagePhotoView.image = sharedImage
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func loadShareFile(fileName:NSString) -> UIImage? {
      let containerURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(ViewController.Constants.AppGroupName)
      let loadURL = containerURL?.path?.stringByAppendingPathComponent(fileName)
      if let image = UIImage(contentsOfFile: loadURL!) {
        return image
      }
      return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
    @IBAction func showClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
