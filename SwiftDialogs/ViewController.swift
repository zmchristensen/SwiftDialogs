//
//  ViewController.swift
//  SwiftDialogs
//
//  Created by Zach Christensen on 9/24/15.
//  Copyright © 2015 Zach Christensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let TIME_INTERVAL = NSTimeInterval(3)
    var timer: NSTimer!
    var progressCounter: Int!
        
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var loadingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        borderAndRoundButton(self.progressButton)
        borderAndRoundButton(self.loadingButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func launchLoadingDialog(sender: AnyObject) {
        let loadingDialog = LoadingDialog(title: "Loading...")
        loadingDialog.presentFromView(self.view)
        dismissAfterDelay(loadingDialog, interval: UInt64(self.TIME_INTERVAL))
    }

    @IBAction func launchProgressDialog(sender: AnyObject) {
        let progressDialog = ProgressDialog(title: "Progressing...", progress: 0.0)
        progressDialog.presentFromView(self.view)
        self.progressCounter = 0
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(self.TIME_INTERVAL / 10, target: self, selector: Selector("updateProgress:"), userInfo: progressDialog, repeats: true)
        
        dismissAfterDelay(progressDialog, interval: UInt64(self.TIME_INTERVAL))
    }
    
    
    // Utility func to border and round buttons
    func borderAndRoundButton(button: UIButton) {
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.layer.borderColor = UIColor.accentColor().CGColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
    }
    
    // Utility func to remove the dialog after time interval
    func dismissAfterDelay(dialog: Dialog, interval: UInt64) {
        let popTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * NSEC_PER_SEC))
        dispatch_after(popTime, dispatch_get_main_queue(), {
            dialog.clearFromView()
        })
    }
    
    func update(dialog: ProgressDialog, interval: UInt64) {
        let popTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * NSEC_PER_SEC))
        dispatch_after(popTime, dispatch_get_main_queue(), {
            dialog.updateProgress(0.5)
        })
    }
    
    // Utility func to animate progress bar
    func updateProgress(timer: NSTimer) {
        self.progressCounter = self.progressCounter + 1
        
        let dialog = timer.userInfo as! ProgressDialog
        let newProgress = Float(self.progressCounter!) * 0.1
        
        if newProgress > 1.0 {
            self.timer.invalidate()
            dialog.clearFromView()
        }
        else {
            dialog.updateProgress(newProgress)
        }
    }
}

