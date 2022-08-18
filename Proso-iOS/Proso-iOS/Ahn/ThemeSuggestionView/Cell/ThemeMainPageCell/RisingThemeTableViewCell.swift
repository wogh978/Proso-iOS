//
//  RisingThemeTableViewCell.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/18.
//

import UIKit
import SnapKit

class RisingThemeTableViewCell: UITableViewCell {
    
    let risingTheme = RisingThemeSampleModel()
    let userInfoView = UIView()
    let themeInfoView: UIView = {
        let risingThemeSample = RisingThemeSampleModel()
        
        let image = risingThemeSample.risingTheme.ThemeImage
        let title = risingThemeSample.risingTheme.ThemeTitle
        let category = risingThemeSample.risingTheme.ThemeCategory
        let hashtag = risingThemeSample.risingTheme.ThemeHashTag
        
        let view = makeCellView(image, category, title, hashtag)
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
        setUserInfoView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        setLayout()
        
        setUserInfoView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
    }
    
    func addView(){
        [userInfoView, themeInfoView].forEach({
            contentView.addSubview($0)
        })
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        themeInfoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout(){
        userInfoView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        userInfoView.heightAnchor.constraint(equalTo: userInfoView.widthAnchor, multiplier: 42/335).isActive = true
        
        themeInfoView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(userInfoView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setUserInfoView(){
        
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
            userInfoView.addSubview($0)
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
