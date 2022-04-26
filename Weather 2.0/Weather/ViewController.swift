//
//  ViewController.swift
//  Weather
//
//  Created by Гость on 21.04.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLocationManager()
    }
    
    func startLocationManager() {
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
    
    func updateWeatherInfo(lastitude: Double, longtitude: Double) {
        let session = URLSession.shared
        let wrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat\(latitude.description)=62&lon\(longtitude.description)=129&appid=65a1f04afc87fdff81f4bd91b4a3d081&units=metric")
    }

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
}
