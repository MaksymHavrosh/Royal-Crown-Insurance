//
//  AboutUsViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.manager.getAboutUs { (text) in
            self.textView.text = text.htmlToString
        }
    }

}

//MARK: - Actions

private extension AboutUsViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
