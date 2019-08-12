//
//  SummaryViewContoller.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/11.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    var scale: Scale!
    
    @IBOutlet weak var embedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = scale.title
        
        modalPresentationStyle = .overCurrentContext
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let summaryNavigationController as SummaryNavigationController:
            summaryNavigationController.scale = self.scale
        default:
            print("\(type(of: segue.destination))")
        }
    }
}
