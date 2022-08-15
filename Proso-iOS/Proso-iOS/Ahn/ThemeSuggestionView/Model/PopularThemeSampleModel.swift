//
//  PopularThemeSampleModel.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation
import UIKit


struct ThemeSample{
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

struct PopularThemeSampleModel{
    
    let popularThemeSample =
    [
        ThemeSample(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "risingTheme_example1") ?? UIImage()),
        
        ThemeSample(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "themeImage_example") ?? UIImage()),
        
        ThemeSample(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "risingTheme_example1") ?? UIImage()),
        
        ThemeSample(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "themeImage_example") ?? UIImage()),
    ]
    
    func getSampleTheme() -> [ThemeSample]{ ///해쉬태그 배열을 가져오기 위한 함수 선언
        return popularThemeSample
    }
}
