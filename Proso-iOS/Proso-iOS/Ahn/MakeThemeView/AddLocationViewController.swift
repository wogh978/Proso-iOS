//
//  AddLocationViewController.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/10.
//

import UIKit

class AddLocationViewController: UIViewController, MTMapViewDelegate {
    
    var mapView: MTMapView!
    //var location1 = MTMapPointGeo(latitude: 45.89117277108821, longitude: 113.63666268178552)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        
        view.backgroundColor = .white
        /*mapView = MTMapView(frame: self.view.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        
        self.view.addSubview(mapView)
        view.backgroundColor = .white*/
    }
    

    private func setUpNavigationBar() {
        title = "장소 추가하기"
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?
                                        .withTintColor(.black, renderingMode: .alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }

}
