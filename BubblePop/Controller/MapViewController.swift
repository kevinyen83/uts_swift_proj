//
//  MapViewController.swift
//  BubblePop
//
//  Created by KerwinYen on 5/14/23.
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        print("loadView() called")
    }
}
