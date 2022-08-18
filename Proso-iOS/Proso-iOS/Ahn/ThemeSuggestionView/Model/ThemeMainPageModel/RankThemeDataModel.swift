//
//  RankThemeData.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation

struct RankThemeData{
    let themeImage: UIImage
    let themeTitle: String
    let themeHeartCount: Int
    
    init(_ image: UIImage, _ title: String, _ heartcount: Int) {
        themeImage = image
        themeTitle = title
        themeHeartCount = heartcount
    }
}

struct RankThemeDataModel{
    let SampleRank = [
        RankThemeData(UIImage(named: "rank1") ?? UIImage(), "서울 근교 분위기 좋은 카페들", 52),
        RankThemeData(UIImage(named: "rank2") ?? UIImage(), "인스타 피드 업데이트용 레스토랑 모음", 52),
        RankThemeData(UIImage(named: "rank3") ?? UIImage(), "그림 실력 뽐내는 원데이 클래스", 52)
    ]
}
