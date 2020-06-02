//
//  Marker.swift
//  Royal Crown Insurance
//
//  Created by MG on 02.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import Foundation

class Marker: NSObject {
    
    let address: String
    let email: String
    let fax: String
    let id: String
    let latitude: Double
    let longitude: Double
    let phone: String
    let postalCode: String
    let title: String
    
    init(dict: [String : Any]) {
        
        self.address = dict["address"] as? String ?? "No address"
        self.email = dict["email"] as? String ?? "No email"
        self.fax = dict["fax"] as? String ?? "No fax"
        self.id = dict["id"] as? String ?? "No id"
        self.latitude = dict["latitude"] as? Double ?? 0
        self.longitude = dict["longitude"] as? Double ?? 0
        self.phone = dict["phone"] as? String ?? "No phone"
        self.postalCode = dict["postal_code"] as? String ?? "No postal_code"
        self.title = dict["title"] as? String ?? "No title"
        
    }

}
