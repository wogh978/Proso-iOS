//
//  PopularThemeSampleModel.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/16.
//

import Foundation
import UIKit



struct PopularThemeSampleModel{
    
    let popularThemeSample =
    [
        ThemeModel(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "risingTheme_example1") ?? UIImage()),
        
        ThemeModel(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "themeImage_example") ?? UIImage()),
        
        ThemeModel(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "risingTheme_example1") ?? UIImage()),
        
        ThemeModel(category: "카페 / 음식점", title: "신사카페에서 인스타 업뎃하기", hashtag: ["감성 있는", "카페"], image: UIImage(named: "themeImage_example") ?? UIImage()),
    ]
    
    func getSampleTheme() -> [ThemeModel]{ ///해쉬태그 배열을 가져오기 위한 함수 선언
        return popularThemeSample
    }
}
