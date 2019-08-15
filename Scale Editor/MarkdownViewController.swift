//
//  EditorController.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/08.
//  Copyright © 2019 crome110. All rights reserved.
//

import UIKit
import Notepad

enum Mode: Int {
    case Edit = 0
    case Browse = 1
}

class MarkdownViewController: UIViewController {
    
    var scale : Scale!
    var notepad: Notepad!

    static var mode = Mode.Edit
    
    @IBAction func modeChange(_ sender: UISegmentedControl) {
        if let mode_ = Mode(rawValue: sender.selectedSegmentIndex) {
            MarkdownViewController.mode = mode_
        }
        
        justifyMode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = scale.title
        
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "one-light-custom", ofType: "json")
        let theme = Theme(themePath: path!)

        notepad = Notepad(frame: view.bounds, theme: theme)
        notepad.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        notepad.delegate = self
        notepad.text = scale.description
        
        justifyMode()
        
        view.addSubview(notepad)
    }
    
    func setMarkdown(_ markdown: String) {
        notepad.text = markdown
    }
    
    func justifyMode() {
        switch MarkdownViewController.mode {
        case Mode.Browse:
            notepad.isEditable = false
        case Mode.Edit:
            notepad.isEditable = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let summaryViewController as SummaryViewController:
            summaryViewController.scale = scale
        default:
            print("\(type(of: segue.destination))")
        }
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

extension MarkdownViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        scale.description = textView.text
    }
}
