//
//  RandomSelectedViewController.swift
//  Proso-iOS
//
//  Created by changgyo seo on 2022/08/08.
//

import UIKit
import SnapKit

class RandomSelectedViewController: UIViewController {
    
    var scrollView = UIScrollView()
    let contentView = UIView()
    let mapView = MTMapView()
    let infoView = UIView()
    let kindOfStoreLabel: UILabel = {
        let label = UILabel()
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        label.backgroundColor = .secondaryColor
        label.textColor = .white
        label.text = "카페/음식점"
        
        return label
    }()
    let storeNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "투썸플레이스 인하대후문점"
        label.textColor = .black
        
        return label
    }()
    let distanceLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .secondNaturalColor
        label.text = "92m"
        
        return label
    }()
    let distanceDivider: UIView = {
        let view = UIView()
        
        view.backgroundColor = .secondNaturalColor
        
        return view
    }()
    let takenTimeLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .secondNaturalColor
        label.text = "내 위치에서 도보 5분"
        
        return label
    }()
    let locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "map.fill"))
            
        imageView.tintColor = .secondNaturalColor
        
        return imageView
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .secondNaturalColor
        label.text = "인천 미추홀구 이나로 75 2-3층"
        
        return label
    }()
    let phoneImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "phone.fill"))
            
        imageView.tintColor = .secondNaturalColor
        
        return imageView
    }()
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .secondNaturalColor
        label.text = "032-861-0035"
        
        return label
    }()
    let divider: UIView = {
       let view = UIView()
        
        view.backgroundColor = .thirdNaturalColor
        
        return view
    }()
    let reviewTitle: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "리뷰(12)"
        label.textColor = .black
        
        return label
    }()
    let reivewTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attributes()
        settingNavigationBarAndTabBar()
        layout()
    }
    
    private func settingNavigationBarAndTabBar() {
        self.tabBarController?.tabBar.isHidden = true
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        standardAppearance.backgroundColor = .white
        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
        
        title = "내 주변 즉흥 장소"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setUpNavigationItems(items: [.back])
    }
    
    private func attributes(){
        scrollView.bounces = false
        
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 10
        infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        infoView.layer.masksToBounds = false
        infoView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        infoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        infoView.layer.shadowOpacity = 0.5
        infoView.layer.shadowRadius = 20
        
        locationImageView.heightAnchor.constraint(equalTo: locationImageView.widthAnchor, multiplier: 1.0/1.0).isActive = true
        
        phoneImageView.heightAnchor.constraint(equalTo: phoneImageView.widthAnchor, multiplier: 1.0/1.0).isActive = true
        
        reivewTableView.delegate = self
        reivewTableView.dataSource = self
        reivewTableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "ReviewTableViewCell")
    
        reivewTableView.backgroundColor = .white
        reivewTableView.separatorStyle = .none
        reivewTableView.sectionIndexColor = .none
    }
    
    private func layout(){
        [kindOfStoreLabel, storeNameLabel, distanceLabel, distanceDivider, takenTimeLabel, locationImageView, locationLabel, phoneImageView, phoneNumberLabel, divider, reviewTitle, reivewTableView].forEach {
            infoView.addSubview($0)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{ element in
            element.edges.equalTo(0)
            element.width.equalToSuperview()
            element.height.equalTo(1300)
        }
        
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalTo(600)
        }
        contentView.addSubview(infoView)
        infoView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(-10)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        kindOfStoreLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.left.equalToSuperview().inset(20)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(kindOfStoreLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        distanceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(8)
        }
        
        distanceDivider.snp.makeConstraints {
            $0.leading.equalTo(distanceLabel.snp.trailing).offset(8)
            $0.top.equalTo(distanceLabel.snp.top)
            $0.height.equalTo(distanceLabel.snp.height)
            $0.width.equalTo(1)
        }
        
        takenTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(distanceDivider.snp.trailing).offset(8)
            $0.top.equalTo(distanceDivider.snp.top)
        }
        
        locationImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(distanceLabel.snp.bottom).offset(40)
            $0.height.equalTo(distanceLabel.snp.height)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(locationImageView.snp.trailing).offset(14)
            $0.centerY.equalTo(locationImageView.snp.centerY)
        }
        
        phoneImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(locationLabel.snp.bottom).offset(10)
            $0.height.equalTo(locationImageView.snp.height)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(phoneImageView.snp.trailing).offset(14)
            $0.centerY.equalTo(phoneImageView.snp.centerY)
        }
        
        divider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(phoneImageView.snp.bottom).offset(30)
            $0.height.equalTo(1)
        }
        
        reviewTitle.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        reivewTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(reviewTitle.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension RandomSelectedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as? ReviewTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == mapView.frame.height {
            scrollView.setContentOffset(CGPoint(x: 0, y: mapView.frame.height), animated: false)
        }
    }
}

