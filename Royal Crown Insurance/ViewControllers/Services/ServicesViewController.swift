//
//  ServicesViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 29.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}

//MARK: - Actions

private extension ServicesViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
