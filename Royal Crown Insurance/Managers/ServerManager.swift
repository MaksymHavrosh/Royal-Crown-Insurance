//
//  ServerManager.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import Alamofire

class ServerManager {
    
    static let manager = ServerManager()
    
    func getAboutRoyalAssist(success: @escaping (String) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/about_royal_assist",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let dict = value as? [String: Any], let text = dict["about_royal_assist"] as? String else { return }
                        
                        success(text)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
    }
    
    func getServices(params: [String : Any], success: @escaping ([[String : Any]]) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/services",
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let array = value as? [[String : Any]] else { return }
                        
                        success(array)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
    }
    
    func getWhatToDoIf(success: @escaping ([[String : Any]]) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/accident_instructions",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let array = value as? [[String : Any]] else { return }
                        
                        success(array)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
        
    }
    
    func getAboutUs(success: @escaping (String) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/about_us",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let dict = value as? [String: Any], let text = dict["about_us"] as? String else { return }
                        
                        success(text)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
        
    }
    
    func getBranches(success: @escaping ([Marker]) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/branches",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let array = value as? [[String: Any]] else { return }
                        var markers = [Marker]()
                        
                        for objectDict in array {
                            let marker = Marker(dict: objectDict)
                            markers.append(marker)
                        }
                        
                        success(markers)
                        
                    case .failure(let error):
                        print(error)
                    }
        }
        
    }
    
    func getInfo(success: @escaping ([String: Any]) -> Void) {
        
        AF.request("http://31.131.21.105:82/api/v1/contacts",
                   method: .get,
                   encoding: URLEncoding.default).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        guard let array = value as? [String: Any] else { return }
                        
                        success(array)
                        
                    case .failure(let failure):
                        print(failure)
                    }
                    
        }
        
    }

}
