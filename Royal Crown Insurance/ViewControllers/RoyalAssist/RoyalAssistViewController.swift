//
//  RoyalAssistViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 29.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class RoyalAssistViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private var phoneNumber: String?
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.manager.getInfo { (infoDict) in
            guard let link = infoDict["phone"] as? String else { return }
            self.phoneNumber = link
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        print(image.size)
    }
    
}

//MARK: - Actions

private extension RoyalAssistViewController {
    
    @IBAction func makeACall(_ sender: Any) {
        
        guard let phoneNumber = phoneNumber, let number = URL(string: "tel:\(phoneNumber)") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    @IBAction func reportAnAccident(_ sender: Any) {
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera){

            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }

            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
