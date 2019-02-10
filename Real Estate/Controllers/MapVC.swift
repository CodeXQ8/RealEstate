//
//  MapVC.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 2/9/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class MapVC: UIViewController ,CLLocationManagerDelegate{

    
    var locationManager:CLLocationManager!
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    
    var mapView : GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = GMSMapView()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
    
        determineMyCurrentLocation()

        
        // Creates a marker in the center of the map.
 
        
        
    }
 
    
    
        func determineMyCurrentLocation() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
               // locationManager.startUpdatingHeading()
            }
        
        }
    

    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let userLocation = locations.last
            let lat = (userLocation!.coordinate.latitude)
            let long = (userLocation!.coordinate.longitude)
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 15.0)
            mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView!.isMyLocationEnabled = true
            mapView!.animate(to: camera)
            view = mapView
            
            showPartyMarkers(lat: lat, long: long)
            
//            let marker = GMSMarker()
//
//            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
//            marker.title = "Sydney"
//            marker.snippet = "Australia"
//            marker.map = mapView
            
//            let userLocation:CLLocation = locations[0] as CLLocation
//
//            // Call stopUpdatingLocation() to stop listening for location updates,
//            // other wise this function will be called every time when user location changes.
//            print("locations = \(locations)")
//            //manager.stopUpdatingLocation()
//             latitude = userLocation.coordinate.latitude
//             longitude = userLocation.coordinate.longitude
//
//
//            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom:17)
//            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
////            mapView.isMyLocationEnabled = false
////            view = mapView
//
//
//            locationManager.delegate = nil
//            locationManager.stopUpdatingLocation()
//            let location = locations.last
//            let lat = (location?.coordinate.latitude)!
//            let long = (location?.coordinate.longitude)!
//
//
//            mapView.animate(to: camera)
//
//            let marker = GMSMarker()
//
//            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
//            marker.title = "Sydney"
//            marker.snippet = "Australia"
//            marker.map = mapView
    
        }
    
    func showPartyMarkers(lat: Double, long: Double) {
        mapView!.clear()
        for i in 0..<3 {
            let randNum=Double(arc4random_uniform(30))/10000
            let marker=GMSMarker()
            let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: 50 , height: 70), image: UIImage(named: "icons8-home-27")!, borderColor: UIColor.darkGray, tag: i)
            marker.iconView=customMarker
            let randInt = arc4random_uniform(4)
            if randInt == 0 {
                marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long-randNum)
            } else if randInt == 1 {
                marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long+randNum)
            } else if randInt == 2 {
                marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long-randNum)
            } else {
                marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long+randNum)
            }
            marker.map = mapView
        }
    }
    
    
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
        {
            print("Error \(error)")
        }
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if(status == CLAuthorizationStatus.denied) {
                showLocationDisabledPopUp()
            }
        }
    
        // Show the popup to the user if we have been deined access
        func showLocationDisabledPopUp() {
            let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                    message: "Please enable location to access all feautres",
                                                    preferredStyle: .alert)
    
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
    
            let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alertController.addAction(openAction)
    
            self.present(alertController, animated: true, completion: nil)
        }
    
    


}
