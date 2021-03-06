//: Playground - noun: a place where people can play

import CoreLocation

/// An observer that is notified of changes whenever the user’s location changes.
protocol LocationObserver: class {
    func didLocationChange(location: CLLocation)
}

/// A service (i.e. the “subject”) that listens to changes to a user’s location and reports those changes to its observers.
class LocationService: NSObject, CLLocationManagerDelegate {
    
    var observers = [LocationObserver]()
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        return locationManager
    }()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for observer in observers {
            observer.didLocationChange(location: locations[0])
        }
    }
    
    func subscribe(observer: LocationObserver) {
        observers.append(observer)
    }
    
    func startUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdates() {
        locationManager.stopUpdatingLocation()
    }
}
