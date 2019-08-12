//
//  SummaryNavigationViewController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/11.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit
import Notepad

class SummaryNavigationController: UINavigationController {
    
    var scale: Scale!
    
    var notepad: Notepad!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = scale.title

        if let editor = self.topViewController as? SummaryEditorController {
            editor.scale = scale
        }
    }
}
