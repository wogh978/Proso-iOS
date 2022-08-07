//
//  MainViewController.swift
//  Proso-iOS
//
//  Created by changgyo seo on 2022/08/07.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.systemFont(ofSize: 24)
        label.text = "효빈님, 오늘은 \n 어떤 즉흥적인 일이 생길까요?"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    let subInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 당장 아무 곳이나 상관 없다고요?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00)
        
        return label
    }()
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.text = "식당으로 갈까요?"
        label.textColor = .black
        
        return label
    }()
    var viewList: [randomButton] {
        return randomButton.allCases + randomButton.allCases + randomButton.allCases
    }
    
    let leftButton = UIButton()
    let rightButton = UIButton()
    let collectionView: UICollectionView = {
        let fl = UICollectionViewFlowLayout()
        fl.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: fl)
        
        return cv
    }()
    
    var leftInset : CGFloat = 82
    var rightInset : CGFloat = 82
    
    lazy var curIdx = self.viewList.count
    var cantAnimation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLogo()
        navigationController?.addUnderLineView()
        layout()
        attributes()
    }
    
    private func attributes() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(randomButtonCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        leftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftButton.tintColor = .black
        leftButton.addTarget(self, action: #selector(tapLeftButton(_:)), for: .touchUpInside)
        
        rightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rightButton.tintColor = .black
        rightButton.addTarget(self, action: #selector(tapRightButton(_:)), for: .touchUpInside)
    }
    
    private func layout() {
        [titleLabel, collectionView, leftButton, rightButton, subInfoLabel, infoLabel].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.width * 277 / 375)
        }
        
        leftButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.width.equalTo(leftInset)
            $0.top.equalTo(collectionView.snp.top)
            $0.bottom.equalTo(collectionView.snp.bottom)
        }
        
        rightButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.width.equalTo(rightInset)
            $0.top.equalTo(collectionView.snp.top)
            $0.bottom.equalTo(collectionView.snp.bottom)
        }
        
        subInfoLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subInfoLabel.snp.bottom).offset(4)
        }
    }
    @objc private func tapLeftButton(_ sender: Any){
        collectionView.setContentOffset(CGPoint(x: collectionView.contentOffset.x - (view.frame.width / 2), y: 0) , animated: true)
    }
    @objc private func tapRightButton(_ sender: Any){
        collectionView.setContentOffset(CGPoint(x: collectionView.contentOffset.x + (view.frame.width / 2), y: 0) , animated: true)
    }
    private func changeThemeTitle(index: Int) {
        print(index)
        infoLabel.text = viewList[index].title
        
    }
}

extension MainViewController: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate ,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as? randomButtonCell else { return UICollectionViewCell() }
        cell.imageView = UIImageView(image: viewList[indexPath.section].image)
        changeThemeTitle(index: indexPath.section % viewList.count)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - leftInset - rightInset, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (cantAnimation) {
            cantAnimation.toggle()
            self.curIdx = indexPath.section
        }
        else {
            let x = indexPath.section
            collectionView.isScrollEnabled = false
            let curCell = collectionView.cellForItem(at: IndexPath(row: 0, section: curIdx))
            cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            collectionView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(x), y: self.collectionView.contentInset.top), animated: true)
            UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                cell.transform = .identity
            }){ _ in
                if x == 0 {
                    self.cantAnimation = true
                    collectionView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat( self.viewList.count / 3 - 1), y: self.collectionView.contentInset.top), animated: false)
                }
                else if  x ==  self.viewList.count - 1 {
                    self.cantAnimation = true
                    collectionView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(self.viewList.count / 3 + 1), y: self.collectionView.contentInset.top), animated: false)
                }
                self.curIdx = x
                collectionView.isScrollEnabled = true
            }
        }
    }
}

class randomButtonCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(imageView ?? UIImageView())
        imageView?.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

enum randomButton: CaseIterable {
    case meal
    case cafe
    
    var image: UIImage {
        switch self {
        case .cafe:
            return UIImage(named: "cafeButton") ?? UIImage()
        case .meal:
            return UIImage(named: "mealButton") ?? UIImage()
        }
    }
    
    var title: String {
        switch self {
        case .cafe:
            return "카페"
        case .meal:
            return "식당"
        }
    }
}

