//
//  DocumentViewController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/10.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit

class DocumentViewController: UINavigationController {

    var scale: Scale!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for viewController in viewControllers {
            switch viewController {
            case let m as MarkdownViewController:
                m.scale = self.scale
            default:
                print("\(type(of: viewController))")
            }
        }
    }

}
