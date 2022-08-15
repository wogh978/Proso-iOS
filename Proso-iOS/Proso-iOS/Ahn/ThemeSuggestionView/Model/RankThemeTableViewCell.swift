//
//  RankThemeTableViewCell.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation
import SnapKit
import UIKit

class RankThemeTableViewCell: UITableViewCell {

    var rankLabel = UILabel()
    var rankImg = UIImageView()
    var rankTitle = UILabel()
    var rankHeart = UIImageView()
    var rankHeartCount = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
        setAttributes()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    func setUpCell() {
        rankLabel = UILabel()
        rankImg = UIImageView()
        rankTitle = UILabel()
        rankHeart = UIImageView()
        rankHeartCount = UILabel()
        
        [rankLabel,rankImg,rankTitle,rankHeart,rankHeartCount].forEach({
            contentView.addSubview($0)
        })
        
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        rankImg.translatesAutoresizingMaskIntoConstraints = false
        rankTitle.translatesAutoresizingMaskIntoConstraints = false
        rankHeart.translatesAutoresizingMaskIntoConstraints = false
        rankHeartCount.translatesAutoresizingMaskIntoConstraints = false

        rankLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        rankImg.snp.makeConstraints{
            $0.leading.equalTo(rankLabel.snp.trailing).offset(28)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(rankImg.snp.height)
        }
        rankTitle.snp.makeConstraints{
            $0.leading.equalTo(rankImg.snp.trailing).offset(12)
            $0.top.equalToSuperview().inset(3)
        }
        rankHeart.snp.makeConstraints{
            $0.leading.equalTo(rankImg.snp.trailing).offset(12.98)
            $0.bottom.equalToSuperview().inset(4)
        }
        rankHeartCount.snp.makeConstraints{
            $0.leading.equalTo(rankHeart.snp.trailing).offset(4.92)
            $0.centerY.equalTo(rankHeart.snp.centerY)
        }
    }
    
    func setAttributes() {
        rankLabel.textColor = .black
        rankLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        rankTitle.font = UIFont.systemFont(ofSize: 14.0)
        rankTitle.textColor = .black
        
        rankTitle.font = UIFont.systemFont(ofSize: 14.0)
        rankTitle.textColor = .black
        
        rankHeart.image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
        rankHeart.tintColor = #colorLiteral(red: 1, green: 0.4265864491, blue: 0.4015736282, alpha: 1)
        
        rankHeartCount.font = UIFont.systemFont(ofSize: 12.0)
        rankHeartCount.textColor = #colorLiteral(red: 0.4756370187, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
    }
}
    
