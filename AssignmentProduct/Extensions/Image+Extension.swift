//
//  Image+Extension.swift
//  AssignmentProduct
//
//  Created by Apple on 14/08/24.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {return}
        let resource = KF.ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
        
    }
    
    func setBorder(colour: UIColor){
        self.layer.borderWidth = 2
        self.layer.borderColor = colour.cgColor
    }
}

