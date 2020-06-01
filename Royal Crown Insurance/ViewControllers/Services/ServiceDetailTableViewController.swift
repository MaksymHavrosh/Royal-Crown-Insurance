//
//  ServiceDetailTableViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class ServiceDetailTableViewController: UITableViewController {
    
    var serviceObject: [String: Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0, let title = serviceObject?["title"] as? String {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceDetail", for: indexPath)
            cell.textLabel?.text = title
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTableViewCell.self), for: indexPath) as! DescriptionTableViewCell
            if let description = serviceObject?["description"] as? String {
                cell.descriptionTextLabel.text = description.htmlToString
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
    
}

//MARK: - Actions

private extension ServiceDetailTableViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
