//
//  PersonalTableViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 31.05.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class PersonalTableViewController: UITableViewController {
    
    private var servicesArray: [[String : Any]]?
    private var selectService: [String : Any]?
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.manager.getServices(params: ["service_type" : "personal"]) { (array) in
            self.servicesArray = array
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        servicesArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.size.height / 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalServices", for: indexPath)
        let object = servicesArray?[indexPath.row]
        
        if let title = object?["title"] as? String {
            cell.textLabel?.text = title
            cell.textLabel?.textAlignment = .center
        }
        return cell
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ServiceDetailTableViewController {
            vc.serviceObject = selectService
            vc.title = "Personal"
        }
    }

}

//MARK: - UITableViewDelegate

extension PersonalTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectService = servicesArray?[indexPath.row]
        self.performSegue(withIdentifier: "ShowServiceDetail", sender: nil)
    }
    
}

//MARK: - Actions

private extension PersonalTableViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
