//
//  AboutRoyalAssistViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 29.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class AboutRoyalAssistViewController: UIViewController {

    @IBOutlet private weak var textViewAboutRoyalAssist: UITextView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.manager.getAboutRoyalAssist { (text) in
            self.textViewAboutRoyalAssist.text = text.htmlToString
        }
    }

}

//MARK: - Actions

private extension AboutRoyalAssistViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
