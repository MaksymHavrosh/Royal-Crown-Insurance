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

class BranchesViewController: UIViewController {
    
    @IBOutlet weak var detailMarkerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    
    var gMarkers: [GMSMarker]?
    var markers: [Marker]?
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.manager.getBranches { (markers) in
            self.markers = markers
            
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
                
                self.gMarkers?.append(gMarker)
            }
            self.view.bringSubviewToFront(self.detailMarkerView)
        }
    }
    
}

//MARK: - GMSMapViewDelegate

extension BranchesViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let markers = markers else { return false }
        marker.icon = UIImage(named: "pin_active_icon")
        
        for markerObject in markers {
            
            guard marker.title == markerObject.title, let index = markers.firstIndex(of: markerObject) else { continue }
            let marker = markers[index]
            
            titleLabel.text = marker.title
            addressLabel.text = marker.address.htmlToString
            phoneLabel.text = marker.phone
            faxLabel.text = marker.fax
            emailLabel.text = marker.email
            postalCodeLabel.text = marker.postalCode
            
            detailMarkerView.isHidden = false
        }
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        detailMarkerView.isHidden = true
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        marker.icon = UIImage(named: "pin_passive_icon")
    }
    
}

//MARK: - Actions

private extension BranchesViewController {
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        guard let vc = navigationController?.viewControllers[0] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
}
