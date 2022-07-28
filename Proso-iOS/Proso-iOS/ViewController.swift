//
//  ViewController.swift
//  Proso-iOS
//
//  Created by changgyo seo on 2022/07/28.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController,MTMapViewDelegate {
   
    var mapView: MTMapView!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           mapView = MTMapView(frame: self.view.frame)
           mapView.delegate = self
           mapView.baseMapType = .standard
           self.view.addSubview(mapView)
       }
    


}

