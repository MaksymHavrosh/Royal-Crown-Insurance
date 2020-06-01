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

//MARK: - Private

private extension ServicesViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
