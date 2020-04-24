//
//  PlaceTableViewCell.swift
//  NearBy
//
//  Created by Heba on 4/19/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class PlaceTableViewCell: UITableViewCell {
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.contentMode = .scaleAspectFill
    }
    
    func configureWith(place: NearByPlaces.ViewModel.Place, loadImageTask: Observable<Photo>?) {
        disposeBag = DisposeBag()
        
        self.textLabel?.text = place.title
        self.detailTextLabel?.text = place.subtitle
        self.imageView?.image = UIImage(named: "photo")
        
        loadImageTask?.subscribe(onNext: { [weak self] response in
            if let photo = response.photos.items.first {
                let imageUrl = "\(photo.prefix)\(photo.width)x\(photo.height)\(photo.suffix)"
                self?.imageView?.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "photo"))
            }
        }).disposed(by: disposeBag)
    }
}
