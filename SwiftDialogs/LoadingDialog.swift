//
//  LoadingDialog.swift
//  SwiftDialogs
//
//  Created by Zach Christensen on 9/24/15.
//  Copyright © 2015 Zach Christensen. All rights reserved.
//

import Foundation
import UIKit

class LoadingDialog: Dialog {
    
    var titleMessage: String!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    init(title: String) {
        super.init(nibName: "LoadingDialogController")
        
        self.titleMessage = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = titleMessage
        self.contentView.layer.cornerRadius = 20;
    }
    
}