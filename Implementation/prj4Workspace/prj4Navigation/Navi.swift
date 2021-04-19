//
//  Navi.swift
//  prj4Navigation
//
//  Created by Julia Sartori on 14.04.21.
//

import Foundation
import SwiftUI
import UIKit
import MapKit
import CoreLocation



struct Navi: View {
    
//Version 1:
    

     @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5085300, longitude: -0.1257400), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State var tracking : MapUserTrackingMode = .follow
    @State var manager = CLLocationManager()
    @StateObject var managerDelegate = locationDelegate()
    
    var body : some View{
        VStack{
     
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking)
        }
        .onAppear {
            manager.delegate = managerDelegate
        }
    }
}

class locationDelegate : NSObject, ObservableObject, CLLocationManagerDelegate{
    

    //checking authorization status
     
    func locationManagerDidChangeAuthorization ( manager: CLLocationManager){
     
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            
            print("authorized")
     
            
            manager.startUpdatingLocation()
     
           
        }
        else{
     
            print("not authorized")
            
            //requesting authorization
            manager.requestWhenInUseAuthorization()
            
        }
}
    func locationManager( manager: CLLocationManager, didUpdateLocations
                            locations: [CLLocation]) {
        print("new Location")
    }
}



    
//Version 2:
/*
   var body : some View{
        Navi()
    }
}

    class ViewController: UIViewController {
        
        @IBOutlet var mapView: MKMapView!
        override func viewDidLoad() {
          super.viewDidLoad()
          checkLocationServices()
        }
    }
    
        func checkLocationServices() {
          if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
          } else {
            // Show alert letting the user know they have to turn this on.
          }
        }
        
        let locationManager = CLLocationManager()
        func checkLocationAuthorization() {
          switch CLLocationManager.authorizationStatus() {
          case .authorizedWhenInUse:
            mapView.showsUserLocation = true
           case .denied: // Show alert telling users how to turn on permissions
           break
          case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
          case .restricted: // Show an alert letting them know what’s up
           break
          case .authorizedAlways:
           break
          }
        }
    
*/

//Version3
/*
var body : some View{
        Navi()
     }
 }
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    self.locationManager.delegate = self

    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest

    self.locationManager.requestWhenInUseAuthorization()

    self.locationManager.startUpdatingLocation()

    self.mapView.showsUserLocation = true

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Location Delegate Methods

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations.last

        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)

        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))

        self.mapView.setRegion(region, animated: true)

        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error:" + error.localizedDescription)
    }

}

*/

    struct Navi_Previews: PreviewProvider {
        static var previews: some View {
            Navi()
        }
    }
    




    


