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
    
    let button = UIButton() ///TEST

       override func viewDidLoad() {
           super.viewDidLoad()
           
           view.backgroundColor = .red
// MARK: - TEST
           view.addSubview(button)
           button.setTitle("TEST", for: .normal)
           button.backgroundColor = .white
           button.setTitleColor(.black, for: .normal)
           button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
           button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
       }
    
    @objc private func didTapButton(){
        let rootVC = ProvinceMeetViewController()
        self.navigationController?.pushViewController(rootVC, animated: true)

    }
// MARK: - TEST


}

