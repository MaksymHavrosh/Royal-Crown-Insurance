//
//  WhatToDoIfTableViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit

class WhatToDoIfTableViewController: UITableViewController {
    
    private var toDoArray: [[String: Any]]?
    var selectToDo: [String: Any]?
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        
        ServerManager.manager.getWhatToDoIf { (array) in
            self.toDoArray = array
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.size.height / 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhatToDoIfCell", for: indexPath)
        
        let toDo = toDoArray?[indexPath.row]
        
        if let title = toDo?["title"] as? String {
            cell.textLabel?.text = title
            cell.textLabel?.textAlignment = .center
        }
        
        return cell
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ToDoViewController {
            vc.toDoObject = selectToDo
        }
    }

}

//MARK: - UITableViewDelegate

extension WhatToDoIfTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectToDo = toDoArray?[indexPath.row]
        self.performSegue(withIdentifier: "ShowToDo", sender: nil)
    }
    
}

//MARK: - Actions

extension WhatToDoIfTableViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
