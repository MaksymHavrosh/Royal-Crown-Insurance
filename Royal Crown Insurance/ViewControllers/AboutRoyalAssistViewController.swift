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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewAboutRoyalAssist.text = NSLocalizedString("About royal assist", comment: "")
    }

}

//MARK: - Actions

private extension AboutRoyalAssistViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
