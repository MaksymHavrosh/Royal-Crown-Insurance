//
//  E-nsuredViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 02.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import WebKit

class E_nsuredViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let linkForThePayments = "http://cw.royalcrowninsurance.eu/Login.aspx?ReturnUrl=%2f"
    
    //MARK: - LifeCycle

    override func viewWillAppear(_ animated: Bool) {
        showAlert()
    }

}

// MARK: - WKNavigationDelegate

extension E_nsuredViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}

// MARK: - Private

extension E_nsuredViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Confirm", message: "You want to go to an external site?\n\(linkForThePayments)", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        let confirm = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
            self.showWebView()
        }
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWebView() {
        if let url = URL(string: linkForThePayments) {
            activityIndicator.startAnimating()
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
        }
    }
    
}

//MARK: - Actions

extension E_nsuredViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}