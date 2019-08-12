//
//  SummaryEditorController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/11.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit
import Notepad

class SummaryEditorController: UIViewController {

    var scale: Scale!
    var notepad: Notepad!

    @IBAction func back(_ sender: Any) {
        guard let close = self.parent?.parent else {
            return
        }
        
        scale.summary = notepad.text
        
        close.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = scale.title + " - summary"

        let path = Bundle.main.path(forResource: "one-light-custom", ofType: "json")
        let theme = Theme(themePath: path!)
        notepad = Notepad(frame: view.bounds, theme: theme)
        notepad.delegate = self
        notepad.text = scale.summary
        view.addSubview(notepad)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension SummaryEditorController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        scale.summary = textView.text
    }
}
