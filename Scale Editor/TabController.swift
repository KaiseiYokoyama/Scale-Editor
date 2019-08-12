//
//  TabController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/08.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    var scale : Scale = ScaleRoot.root
    
    @objc func swipe(_ sender: UISwipeGestureRecognizer) {
        typealias SwipeDirection = UISwipeGestureRecognizer.Direction
        
        switch (sender.direction, selectedIndex) {
        case (SwipeDirection.right, 1):
            selectedIndex = 0
        case (SwipeDirection.left, 0):
            selectedIndex = 1
        default:
            print("swiped to \(sender.direction)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tab Controller"

        // Do any additional setup after loading the view.
        for viewContoller in viewControllers! {
            switch viewContoller {
            case let d as DocumentViewController:
                d.scale = self.scale
            default:
                print("\(type(of: viewContoller))")
            }
        }
        
        let swipeRight = UISwipeGestureRecognizer()
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.addTarget(self, action: #selector(TabController.swipe(_:)))
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.addTarget(self, action: #selector(TabController.swipe(_:)))
        self.view.addGestureRecognizer(swipeLeft)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
