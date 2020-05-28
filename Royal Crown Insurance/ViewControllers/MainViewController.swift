//
//  MainViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 28.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

}

