//
//  BranchesViewController.swift
//  Royal Crown Insurance
//
//  Created by MG on 01.06.2020.
//  Copyright © 2020 MG. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class BranchesViewController: UIViewController, GMSMapViewDelegate {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.manager.getBranches { (markers) in
            let camera = GMSCameraPosition.camera(withLatitude: markers.first?.latitude ?? 0, longitude: markers.first?.longitude ?? 0, zoom: 7.0)
            let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            self.view.addSubview(mapView)
            mapView.delegate = self
            
            for marker in markers {
                
                let gMarker = GMSMarker()
                gMarker.position = CLLocationCoordinate2D(latitude: marker.latitude, longitude: marker.longitude)
                gMarker.title = marker.title
                gMarker.snippet = marker.address.htmlToString
                gMarker.map = mapView
                gMarker.icon = UIImage(named: "pin_passive_icon")
            }
        }
    }
    
    //MARK: - GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        marker.icon = UIImage(named: "pin_active_icon")
        
        return true
    }
    
}

//MARK: - Actions

private extension BranchesViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
