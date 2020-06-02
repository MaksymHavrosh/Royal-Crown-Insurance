//
//  AboutViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
    }

}

//MARK: - Actions

private extension AboutViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
