//
//  ThemeMainViewController.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/06.
//

import UIKit
import Alamofire
import SnapKit


class ThemeMainViewController: UIViewController,MTMapViewDelegate {

    let searchField: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    // MARK: - 상단 테마 노출 내용
    let mainTableView = UITableView()
    
    
    let risingThemeView: UITableView = {
        let tableView = UITableView()
        
        let risingThemeText: UILabel = {
            let label = UILabel()
            label.text = "요즘 뜨는 테마"
            return label
        }()
        
        var risingThemeTitle: UILabel = {
            var label = UILabel()
            label.text = "더운 여름날은 시원한 곳에서!"
            return label
        }()
        
        tableView.addSubview(risingThemeText)
        tableView.addSubview(risingThemeTitle)
        
        return tableView
    }()
    
    let risingThemeTitle = UITextView()
    let risingThemeContext = UIView()
    
    let popularTheme = UITextView()
    let popularThemeTitle = UITextView()
    
    
    
// MARK: - 스크롤 콜렉션 뷰 초기화 (인기 테마)
    var dataSource: [String] = []

       lazy var collectionView: UICollectionView = {
           let flowLayout = UICollectionViewFlowLayout()
           flowLayout.scrollDirection = .horizontal
           flowLayout.minimumLineSpacing = 50 // cell사이의 간격 설정
           let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
           view.backgroundColor = .brown

           return view
       }()
    
    
    // MARK: -
    
    var mapView: MTMapView!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.searchField)
        self.view.addSubview(self.risingThemeView)
        self.view.addSubview(self.risingThemeContext)
        self.view.addSubview(self.popularTheme)
        self.view.addSubview(self.popularThemeTitle)
        
// MARK: - Constraint 설정
        self.searchField.snp.makeConstraints{
            $0.top.equalTo(navigationController!.navigationBar).offset(28)
            $0.leading.trailing.equalToSuperview().offset(20)
        }

       
        
        self.risingThemeContext.snp.makeConstraints{
            
            $0.leading.trailing.equalToSuperview().offset(20)

        }
        

        
        
        
        
// MARK: - 인기 테마 스크롤뷰 설정 메소드
        setupDataSource()
        addSubviews()
        setupDelegate()
        registerCell()
        configure()
// MARK: -
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
    }
    
// MARK: - viewDidLoad에서 호출 될 메소드 정리
    private func setupDataSource() {
           for i in 0...10 {
               dataSource += ["\(i)"]
           }
       }
    private func addSubviews() {
           view.addSubview(collectionView)
       }
    private func setupDelegate() {
           collectionView.delegate = self
           collectionView.dataSource = self
       }
    private func registerCell() {
           collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.id)
       }
    private func configure() {
           collectionView.snp.makeConstraints {
               $0.center.leading.trailing.equalToSuperview()
               $0.height.equalTo(189)
           }
       }
}

// MARK: - 메인 뷰 UI 구성
extension ThemeMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
// MARK: - 네비게이션 바 생성
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.title = ""
        view.backgroundColor = .white
        
        let addThemeButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"),
                                             style: .plain,
                                             target: self,
                                             action: nil)
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                 style: .plain,
                                                 target: self,
                                                 action: nil)
        let logoImage = UIBarButtonItem(image: UIImage(named: "Proso_Logo"),
                                                style: .done,
                                                target: self,
                                                action: nil)
        
        
        self.navigationItem.rightBarButtonItems = [notificationButton,addThemeButton]
        self.navigationItem.leftBarButtonItem = logoImage
    }
    
// MARK: - 인기 테마 스크롤 뷰 Delegate 구현
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataSource.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.id, for: indexPath)
            if let cell = cell as? MyCell {
                cell.model = dataSource[indexPath.item]
            }

            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 219, height: collectionView.frame.height)
        }
    
}


