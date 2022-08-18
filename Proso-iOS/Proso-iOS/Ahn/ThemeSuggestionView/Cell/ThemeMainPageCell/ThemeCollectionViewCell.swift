//
//  ThemeCell.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/14.
//

import Foundation
import SnapKit
import UIKit


class ThemeCollectionViewCell: UICollectionViewCell{
    let cellImage: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    
    
    let cellCategory: UITextView = {
        let textView = UITextView()
        //textView.text = category
        textView.font = UIFont.systemFont(ofSize: 12.0)
        textView.textColor = .white
        textView.backgroundColor = #colorLiteral(red: 1, green: 0.822599709, blue: 0.4534067512, alpha: 1)
        textView.layer.cornerRadius = 4.0
        textView.textAlignment = .center
        
        return textView
    }()
    
    
    //let cellCategoryViewSize = cellCategory.text.size(withAttributes: [NSAttributedString.Key.font: cellCategory.font ?? UIFont()])
    
    //cellCategory.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    
    
    let cellTitle: UILabel = {
        let label = UILabel()
        //label.text = title
        label.font = UIFont.systemFont(ofSize: 16.0)
        
        return label
    }()
    
    var cellCategoryViewSize = CGSize()
    
    /*let cellHashTag = [UITextView()]
    for index in 0..<hashtag.count{
        cellHashTag[index].text = hashtag[index]
        cellHashTag[index].font = UIFont.systemFont(ofSize: 12.0)
        cellHashTag[index].textColor = #colorLiteral(red: 0.4756370187, green: 0.4756369591, blue: 0.4756369591, alpha: 1)
        cellHashTag[index].backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        cellHashTag[index].layer.cornerRadius = 14.0
        cellHashTag[index].textContainerInset = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
    }*/
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
         
        contentView.backgroundColor = .white
        contentView.layer.borderColor = #colorLiteral(red: 0.8861967921, green: 0.8861967921, blue: 0.8861967921, alpha: 1)
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 8.0
        contentView.layer.masksToBounds = true
        
        cellCategory.textContainerInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
        
        [cellImage, cellCategory,cellTitle].forEach({
            contentView.addSubview($0)
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
        }
        
        cellTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalTo(cellCategory.snp.bottom).offset(4)
        }
    }
    
    func setup(with theme: ThemeModel){
        cellImage.image = theme.ThemeImage
        cellCategory.text = theme.ThemeCategory
        cellTitle.text = theme.ThemeTitle
        cellCategoryViewSize = cellCategory.text.size(withAttributes: [NSAttributedString.Key.font: cellCategory.font ?? UIFont()])
        
        cellCategory.snp.makeConstraints{
            $0.width.equalTo(cellCategoryViewSize.width+20)
            $0.height.equalTo(cellCategoryViewSize.height+8)
        }
    }
}

extension ThemeCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}


