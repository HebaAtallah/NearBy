//
//  LocationProvider.swift
//  NearBy
//
//  Created by Heba on 4/19/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation
import CoreLocation
import RxCoreLocation
import RxSwift

protocol LocationProviderProtocol {
    func startMonitoring(trackingMood: TrackingMood)
}

protocol LocationProviderDelegate: class {
    func didUpdateLocation(location: CLLocation)
    func showErrorMessage()
}

class LocationProvider: LocationProviderProtocol {
    private let disposeBag = DisposeBag()
    private var locationTrackerDisposeBag = DisposeBag()
    let manager = CLLocationManager()
    weak var delegate: LocationProviderDelegate?
    
    init(delegate: LocationProviderDelegate) {
        manager.distanceFilter = 5000
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.delegate = delegate
        checkForAuthorization()
    }
    
    func checkForAuthorization() {
        manager.rx
            .didChangeAuthorization
            .subscribe(onNext: {_, status in
                switch status {
                case .denied, .restricted:
                    self.delegate?.showErrorMessage()
                case .notDetermined:
                    self.manager.requestWhenInUseAuthorization()
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
    
    func startMonitoring(trackingMood: TrackingMood) {
        locationTrackerDisposeBag = DisposeBag()
        
        var locationSubscription = manager.rx.location.asObservable().observeOn(MainScheduler.instance)
        if trackingMood == .singleUpdate {
            locationSubscription = locationSubscription.take(1)
        }
        locationSubscription.subscribeOn(MainScheduler.instance).subscribe(onNext: { location in
            guard let location = location else { return }
            self.delegate?.didUpdateLocation(location: location)
        }).disposed(by: locationTrackerDisposeBag)
    }
}
