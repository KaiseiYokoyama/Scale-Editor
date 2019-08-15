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
    
    static var mode = Mode.Edit

    @IBAction func modeChanged(_ sender: UISegmentedControl) {
        print("SummaryEditorController: mode")
        if let mode_ = Mode(rawValue: sender.selectedSegmentIndex) {
            SummaryEditorController.mode = mode_
        }
        
        justifyMode()
    }
    
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
        notepad.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        notepad.delegate = self
        notepad.text = scale.summary
        
        justifyMode()
        
        view.addSubview(notepad)
    }
    
    func justifyMode() {
        switch SummaryEditorController.mode {
        case Mode.Browse:
            print("SummaryEditorController: editable false")
            notepad.isEditable = false
        case Mode.Edit:
            notepad.isEditable = true
        }
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
