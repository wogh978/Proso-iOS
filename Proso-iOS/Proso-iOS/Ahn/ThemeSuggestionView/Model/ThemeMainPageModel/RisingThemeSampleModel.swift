//
//  risingThemeSampleModel.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/14.
//

import Foundation
import UIKit


struct RisingThemeSampleModel{
    let risingThemeUserProfileImage = UIImage(named: "defaultProfile")
    let risingThemeUserName = "비니"
    let risingThemeHeartCount = 52
    
    
    
    let risingTheme = ThemeModel(category: "카페 / 음식점",
                                 title: "우리 더울 때는 나가지 말고 카페에 있어요.",
                                 hashtag:
                                    [
                                    "감성 있는",
                                    "카페",
                                    "디저트 맛집"
                                    ],
                                 image: UIImage(named: "risingTheme_example1") ?? UIImage())
    
    func getRisingThemeUserInfo(_ name: String) -> Any?{
        switch(name){
        case "profile":
            return risingThemeUserProfileImage
        case "username":
            return risingThemeUserName
        case "heartcount":
            return risingThemeHeartCount
        default:
            return nil
        }
    }
    
    func getRisingThemeContextInfo(_ name: String) -> Any?{
        switch(name){
        case "category":
            return risingTheme.ThemeCategory
        case "title":
            return risingTheme.ThemeTitle
        case "HashTag":
            return risingTheme.ThemeHashTag
        case "image":
            return risingTheme.ThemeImage
        default:
            return nil
        }
    }
}
