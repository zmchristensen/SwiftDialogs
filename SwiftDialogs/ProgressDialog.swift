//
//  ProgressDialog.swift
//  SwiftDialogs
//
//  Created by Zach Christensen on 9/24/15.
//  Copyright © 2015 Zach Christensen. All rights reserved.
//

import Foundation
import UIKit

class ProgressDialog: Dialog {
    
    var titleMessage: String!
    var progress: Float!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var contentView: UIView!

    
    init(title: String, progress: Float) {
        super.init(nibName: "ProgressDialogController")
        
        self.titleMessage = title
        self.progress = progress
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleMessage
        self.progressBar.progress = self.progress
        self.contentView.layer.cornerRadius = 20;
    }
    
    func updateProgress(newProgress: Float) {
        self.progressBar.progress = newProgress
    }
}