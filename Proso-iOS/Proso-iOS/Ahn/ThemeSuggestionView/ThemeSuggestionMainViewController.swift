//
//  ThemeMainViewController.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/06.
//

import UIKit
import Alamofire
import SnapKit


class ThemeSuggestionMainViewController: UIViewController{
   
    
    let popularTheme = PopularThemeSampleModel().getSampleTheme()
    let rankTheme = RankThemeDataModel()
    
// MARK: - 구성요소 추가
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    let contentView = UIView()
    
    let searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색어를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 14.0)
        textField.textColor = #colorLiteral(red: 0.797753036, green: 0.7977529764, blue: 0.7977529764, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = #colorLiteral(red: 0.8861967921, green: 0.8861967921, blue: 0.8861967921, alpha: 1)
        textField.layer.cornerRadius = 8.0
        
        let searchIcon = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)


        let searchIconView = UIImageView(image: searchIcon)
        searchIconView.tintColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        textField.addSubview(searchIconView)
        
        searchIconView.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(9.8)
            $0.top.bottom.equalToSuperview().inset(9.8)
            $0.height.equalTo(searchIconView.snp.width)
        }
        return textField
    }()
    
    
    // MARK: - 요즘 뜨는 테마
    let risingThemeSectionLabel: UILabel = {
        let label = UILabel()
        label.text = "요즘 뜨는 테마"
        label.textColor = #colorLiteral(red: 1, green: 0.4265864491, blue: 0.4015736282, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12.0)
        
        return label
    }()
    
    let risingThemeIntroduction: UILabel = {
        let label = UILabel()
        label.text = "더운 여름날은 시원한 이곳에서!" ///추후 서버에서 데이터를 받아 수정할 예정
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return label
    }()
    
    let risingThemeInfoView = UIView()
    
    let risingThemeInfoCell: UIView = {
        let risingThemeSample = RisingThemeSampleModel()
        
        let image = risingThemeSample.risingTheme.ThemeImage 
        let title = risingThemeSample.risingTheme.ThemeTitle
        let category = risingThemeSample.risingTheme.ThemeCategory
        let hashtag = risingThemeSample.risingTheme.ThemeHashTag
        
        let view = makeCellView(image, category, title, hashtag)
        return view
    }()
    
    let popularThemeSectionLabel: UILabel = {
        let label = UILabel()
        label.text = "인기 테마"
        label.textColor = #colorLiteral(red: 1, green: 0.4265864491, blue: 0.4015736282, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12.0)
        
        return label
    }()
    
    let popularThemeIntroduction: UILabel = {
        let label = UILabel()
        label.text = "인스타 감성 낭낭한 카페 모음" ///추후 서버에서 데이터를 받아 수정할 예정
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return label
    }()
    
    let popularThemeCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let popularThemeRankLabel: UILabel = {
        let label = UILabel()
        label.text = "인기 테마 순위"
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = .black
        
        return label
    }()
    
    /*let popularThemeRankView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.separatorStyle = .none
        return tableView
    }()*/
    
        
    
// MARK: -
    override func viewDidLoad() {
        
       
        collectionViewDelegate()
        //tableViewDelegate()
        self.navigationController?.setUpNavigationItems(items: [.logo,.add,.bell])
        setUserInfoView()
        addView()
        setAtrributes()
        
        view.backgroundColor = .white
    }
    
    private func collectionViewDelegate(){
        popularThemeCollectionView.dataSource = self
        popularThemeCollectionView.delegate = self
        popularThemeCollectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.identifier)
    }
    
    /*private func tableViewDelegate(){
        popularThemeRankView.delegate = self
        popularThemeRankView.dataSource = self
        popularThemeRankView.register(RankThemeTableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
    }*/
    
   
    private func addView(){
        [searchField,risingThemeSectionLabel,risingThemeIntroduction,risingThemeInfoView, risingThemeInfoCell,popularThemeSectionLabel,popularThemeIntroduction,popularThemeCollectionView, popularThemeRankLabel].forEach({
            contentView.addSubview($0)
        })
        mainScrollView.addSubview(contentView)
        self.view.addSubview(mainScrollView)
        
    }
    
    private func setAtrributes(){
        mainScrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerX.top.bottom.equalToSuperview()
        }
        
        searchField.snp.makeConstraints{
            $0.top.equalToSuperview().inset(28)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
      
        risingThemeSectionLabel.snp.makeConstraints{
            $0.top.equalTo(searchField.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
        }
        
        risingThemeIntroduction.snp.makeConstraints{
            $0.top.equalTo(risingThemeSectionLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        risingThemeInfoView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(risingThemeIntroduction.snp.bottom).offset(24)
        }
        
        risingThemeInfoView.heightAnchor.constraint(equalTo: risingThemeInfoView.widthAnchor, multiplier: 42/335).isActive = true
        
        risingThemeInfoCell.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(risingThemeInfoView.snp.bottom).offset(16)
        }
        risingThemeInfoCell.heightAnchor.constraint(equalTo: risingThemeInfoCell.widthAnchor, multiplier: 234/335).isActive = true
        
        popularThemeSectionLabel.snp.makeConstraints{
            $0.top.equalTo(risingThemeInfoCell.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(20)
        }
        
        popularThemeIntroduction.snp.makeConstraints{
            $0.top.equalTo(popularThemeSectionLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        popularThemeCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularThemeIntroduction.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        popularThemeCollectionView.heightAnchor.constraint(equalTo: popularThemeCollectionView.widthAnchor, multiplier: 189/375).isActive = true
        
        
        /*popularThemeRankView.snp.makeConstraints{
            $0.top.equalTo(popularThemeRankLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        popularThemeRankView.heightAnchor.constraint(equalTo: popularThemeRankView.widthAnchor, multiplier: 192/335).isActive = true*/
    }
    
    
    
    private func setUpNavigationBar() {
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?
            .withTintColor(.black, renderingMode: .alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem = backButton
        
        let makeThemeButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle")?
            .withTintColor(.black, renderingMode: .alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: #selector(gotoMakeTheme))
        
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell.badge")?
            .withTintColor(.black, renderingMode: .alwaysOriginal),
                                         style: .plain,
                                         target: self,
                                         action: nil)
        navigationItem.rightBarButtonItems = [notificationButton,makeThemeButton]
        view.backgroundColor = .white
        
        ///그림자 추가하려고 하면 자꾸 글자 쪽에 추가되는 바람에 일단 보류.
    }
    
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func gotoMakeTheme(){
        let rootVC = MakeThemeFirstViewController()
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
    private func setUserInfoView(){
        let risingTheme = RisingThemeSampleModel()
        
        let profileImage = UIImageView()
        let image = risingTheme.getRisingThemeUserInfo("profile") as! UIImage
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = image
        profileImage.backgroundColor = #colorLiteral(red: 0.9593991637, green: 0.9593990445, blue: 0.9593990445, alpha: 1)
        profileImage.layer.cornerRadius = 22.5
        
        
        let themeLabel = UILabel()
        let username = risingTheme.getRisingThemeUserInfo("username") as! String
        let att = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let boldedUsername = NSMutableAttributedString(string: username, attributes: att).string
        themeLabel.text = boldedUsername + "님의 테마"
        themeLabel.font = .systemFont(ofSize: 14.0)
        
        let heart = UIImageView()
        heart.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
        heart.tintColor = #colorLiteral(red: 1, green: 0.4265864491, blue: 0.4015736282, alpha: 1)
        
        let heartCount = UILabel()
        heartCount.text = String(risingTheme.getRisingThemeUserInfo("heartcount") as! Int)
        heartCount.font = UIFont.systemFont(ofSize: 12.0)
        heartCount.textColor = #colorLiteral(red: 0.4756370187, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
        
        
        let moreInfo = UIImageView()
        
        moreInfo.image = UIImage(named: "moreInfo_arrow")?.withRenderingMode(.alwaysTemplate)
        moreInfo.tintColor = #colorLiteral(red: 0.08947802335, green: 0.08947802335, blue: 0.08947802335, alpha: 1)
        
        [profileImage,themeLabel,heart,heartCount,moreInfo].forEach({
            risingThemeInfoView.addSubview($0)
        })
        // MARK: - make Constraints
        
        profileImage.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(profileImage.snp.height)
        }
        
        themeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(3)
            $0.leading.equalTo(profileImage.snp.trailing).offset(10)
        }
        
        heart.snp.makeConstraints{
            $0.leading.equalTo(themeLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(2)
            $0.width.equalTo(16.15)
            $0.height.equalTo(13.98)///
        }
        
        heartCount.snp.makeConstraints{
            $0.leading.equalTo(heart.snp.trailing).offset(4.92)
            $0.bottom.equalToSuperview().inset(2)
            
        }
        
        moreInfo.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(7.28)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(16.22/42)
        }
        moreInfo.widthAnchor.constraint(equalTo: moreInfo.heightAnchor, multiplier: 9.47/16.22).isActive = true
        
    }
    

}

extension ThemeSuggestionMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.identifier, for: indexPath) as! ThemeCollectionViewCell

        
        let theme = popularTheme[indexPath.row] ///음식 컬렉션 뷰이므로 음식 해쉬태그 배열 불러옴, indexPath.row로 Index 지정
        cell.setup(with: theme) ///불러온 해쉬태그 정보를 바탕으로 셀의 텍스트 지정
        ///
        return cell
    }
}

extension ThemeSuggestionMainViewController: UICollectionViewDelegate {
    
}

extension ThemeSuggestionMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: view.frame.width*(219/375), height: view.frame.width*(189/375))
    }

}

/*extension ThemeSuggestionMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankTheme.SampleRank.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = popularThemeRankView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! RankThemeTableViewCell
        cell.rankImg.image = rankTheme.SampleRank[indexPath.row].themeImage
        cell.rankHeartCount.text = String(rankTheme.SampleRank[indexPath.row].themeHeartCount)
        cell.rankTitle.text = rankTheme.SampleRank[indexPath.row].themeTitle
        cell.rankLabel.text = String(indexPath.row+1)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width * 64/375
    }
    
}*/
