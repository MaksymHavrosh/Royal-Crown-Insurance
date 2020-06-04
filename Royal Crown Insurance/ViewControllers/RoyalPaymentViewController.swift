//
//  RoyalPaymentViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 29.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import WebKit

class RoyalPaymentViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var linkForThePayments: String?
    
    //MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
        ServerManager.manager.getInfo { (infoDict) in
            guard let link = infoDict["royal_payment_website"] as? String else { return }
            self.linkForThePayments = link
            self.showAlert()
        }
    }
    
}

// MARK: - WKNavigationDelegate

extension RoyalPaymentViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
}

// MARK: - Private

private extension RoyalPaymentViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Confirm", message: "You want to go to an external site?\n\(linkForThePayments ?? "No link for payment")", preferredStyle: .alert)
        
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
        if let link = linkForThePayments, let url = URL(string: link) {
            activityIndicator.startAnimating()
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
        }
    }
    
}

//MARK: - Actions

private extension RoyalPaymentViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
