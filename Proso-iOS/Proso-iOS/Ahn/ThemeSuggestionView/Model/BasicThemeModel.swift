//
//  ThemeModel.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation
import UIKit

struct ThemeModel{
    let ThemeCategory: String
    let ThemeTitle: String
    let ThemeHashTag: [String]
    let ThemeImage: UIImage
    
    
    init(category: String, title: String, hashtag: [String], image: UIImage) {
        ThemeCategory = category
        ThemeTitle = title
        ThemeHashTag = hashtag
        ThemeImage = image
    }
}

func makeCellView(_ image: UIImage, _ category: String, _ title: String, _ hashtag: [String]) -> UIView{
    
    
    let mainView = UIView()
    mainView.layer.borderColor = #colorLiteral(red: 0.8861967921, green: 0.8861967921, blue: 0.8861967921, alpha: 1)
    mainView.layer.borderWidth = 1.0
    mainView.layer.cornerRadius = 8.0
    mainView.clipsToBounds = true
    
    let cellImage = UIImageView()
    cellImage.image = image
    cellImage.clipsToBounds = true
    cellImage.contentMode = .scaleAspectFill
    
    
    let cellCategory = UITextView()
    cellCategory.text = category
    cellCategory.font = UIFont.systemFont(ofSize: 12.0)
    cellCategory.textColor = .white
    cellCategory.backgroundColor = #colorLiteral(red: 1, green: 0.822599709, blue: 0.4534067512, alpha: 1)
    cellCategory.layer.cornerRadius = 4.0
    cellCategory.textAlignment = .center
    
    let cellCategoryViewSize = cellCategory.text.size(withAttributes: [NSAttributedString.Key.font: cellCategory.font ?? UIFont()])
    
    cellCategory.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    
    
    let cellTitle = UILabel()
    cellTitle.text = title
    cellTitle.font = UIFont.systemFont(ofSize: 16.0)
    
    /*let cellHashTag = [UITextView()]
    for index in 0..<hashtag.count{
        cellHashTag[index].text = hashtag[index]
        cellHashTag[index].font = UIFont.systemFont(ofSize: 12.0)
        cellHashTag[index].textColor = #colorLiteral(red: 0.4756370187, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
        cellHashTag[index].backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        cellHashTag[index].layer.cornerRadius = 14.0
        cellHashTag[index].textContainerInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
    }*/
    
    [cellImage, cellCategory,cellTitle].forEach({
        mainView.addSubview($0)
    })
    /*cellHashTag.forEach({
        mainView.inser($0)
    })*/
    
    // MARK: - constraint
    cellImage.snp.makeConstraints{
        $0.top.equalToSuperview()
        $0.leading.trailing.equalToSuperview()
    }
    cellImage.heightAnchor.constraint(equalTo: cellImage.widthAnchor, multiplier: 120/335).isActive = true
    
    cellCategory.snp.makeConstraints{
        $0.top.equalTo(cellImage.snp.bottom).offset(14)
        $0.leading.equalToSuperview().offset(12)
        $0.width.equalTo(cellCategoryViewSize.width+20)
        $0.height.equalTo(cellCategoryViewSize.height+8)
    }
    
    cellTitle.snp.makeConstraints{
        $0.leading.equalToSuperview().inset(12)
        $0.top.equalTo(cellCategory.snp.bottom).offset(4)
    }
    
    return mainView
}



