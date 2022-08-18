//
//  ThemeSearchTableViewData.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation



struct ThemeSearchResultModel{
    
    var searchResult: [ThemeModel] = [
        ThemeModel(category: "카페 / 음식점", title: "지금 당장 떠나고 싶은 홍대 카페", hashtag: [""], image: UIImage(named: "searchResult_image1") ?? UIImage()),
        ThemeModel(category: "카페 / 음식점", title: "지금 당장 떠나고 싶은 홍대 카페", hashtag: [""], image: UIImage(named: "searchResult_image2") ?? UIImage()),
        ThemeModel(category: "카페 / 음식점", title: "지금 당장 떠나고 싶은 홍대 카페", hashtag: [""], image: UIImage(named: "risingTheme_example1") ?? UIImage())
    ]
}
