//
//  NearByPlacesWorker.swift
//  NearBy
//
//  Created by Heba on 4/18/20.
//  Copyright (c) 2020 Cognitev. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Moya
import RxSwift

protocol PlacesProviderType {
    
    /// loadPlaces Function
    /// - Parameters:
    ///   - latitude: current coordinate latitude
    ///   - longitude: current coordinate longitude
    ///   - completion: to display what the API responded with
    func loadPlaces(latitude: Double, longitude: Double, completion: @escaping(Result<[VenueItem], Errors>) -> Void)
    func loadImageTask(for venueId: String) -> Observable<Photo>
    func loadTrackingMood() -> String
    func saveTrackingMood(trackingMood: TrackingMood)
}

class NearByPlacesWorker: PlacesProviderType {
    private let provider: MoyaProvider<NearByEndPoint> = MoyaProvider<NearByEndPoint>(plugins: [NetworkLoggerPlugin()])
    private let disposeBag = DisposeBag()
    
    func loadPlaces(latitude: Double, longitude: Double, completion: @escaping(Result<[VenueItem], Errors>) -> Void) {
        let request = self.provider.rx.request(
            .nearByPlaces(latitude: latitude, longitude: longitude))
            .asObservable().map(NearByPlaces.VenueResponse.self, atKeyPath: "response")
        request.subscribe(onNext: { response in
            if response.itemVenue.count == 0 {
                completion(.failure(Errors.noData))
            } else {
                completion(.success(response.itemVenue))
            }
        }, onError: { error in
            completion(.failure(Errors.fail))
        }).disposed(by: disposeBag)
    }
    
    func loadImageTask(for venueId: String) -> Observable<Photo> {
        let request = self.provider.rx.request(
            .photos(venueID: venueId))
            .retry(3)
            .asObservable().map(Photo.self, atKeyPath: "response")
        return request
    }
    
    // MARK: Cache data
    func loadTrackingMood() -> String {
        guard let trackingMood = UserDefaults.standard.string(forKey: "TrackingMood") else {
            return TrackingMood.realtime.title
        }
        return trackingMood
    }
    
    func saveTrackingMood(trackingMood: TrackingMood) {
        UserDefaults.standard.set(trackingMood.title, forKey: "TrackingMood")
        UserDefaults.standard.synchronize()
    }
}
