//
//  EditorController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/08.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit
import Notepad

class MarkdownViewController: UIViewController {

    @IBOutlet weak var tabItem: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "one-light-custom", ofType: "json")
        let theme = Theme(themePath: path!)

        let notepad = Notepad(frame: view.bounds, theme: theme)
        view.addSubview(notepad)
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
