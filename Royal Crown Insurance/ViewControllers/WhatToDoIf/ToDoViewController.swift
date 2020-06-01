//
//  ToDoViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tab1Button: UIButton!
    @IBOutlet weak var tab2Button: UIButton!
    
    var toDoObject: [String: Any]?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let text = toDoObject?["tab_1_content"] as? String, let title = toDoObject?["title"] as? String else { return }
        navigationController?.title = title
        textView.text = text.htmlToString
        
        guard let tab1Title = toDoObject?["tab_1_title"] as? String, let tab2Title = toDoObject?["tab_2_title"] as? String, !tab2Title.isEmpty else {
            tab1Button.isEnabled = false
            tab2Button.isEnabled = false
            tab2Button.backgroundColor = .white
            return
        }
        tab1Button.setTitle(tab1Title, for: .normal)
        tab2Button.setTitle(tab2Title, for: .normal)
    }

}

//MARK: - Actions

private extension ToDoViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tab1Content(_ sender: Any) {
        tab1Button.backgroundColor = .white
        tab1Button.setTitleColor(UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1.0), for: .normal)
        tab2Button.setTitleColor(.white, for: .normal)
        tab2Button.backgroundColor = UIColor(red: 90/255, green: 81/255, blue: 155/255, alpha: 1.0)
        
        guard let text = toDoObject?["tab_1_content"] as? String else { return }
        textView.text = text.htmlToString
    }
    
    @IBAction func tab2Content(_ sender: Any) {
        tab2Button.backgroundColor = .white
        tab2Button.setTitleColor(UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1.0), for: .normal)
        tab1Button.setTitleColor(.white, for: .normal)
        tab1Button.backgroundColor = UIColor(red: 90/255, green: 81/255, blue: 155/255, alpha: 1.0)
        
        guard let text = toDoObject?["tab_2_content"] as? String else { return }
        textView.text = text.htmlToString
    }
    
}
