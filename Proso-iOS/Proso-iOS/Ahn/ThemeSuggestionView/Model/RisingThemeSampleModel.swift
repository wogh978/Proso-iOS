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
    

    let risingThemeCategory = "카페 / 음식점"
    let risingThemeTitle = "우리 더울 때는 나가지 말고 카페에 있어요."
    let risingThemeSampleHashTag = [
        "감성 있는",
        "카페",
        "디저트 맛집"
    ]
    let risingThemeImage = UIImage(named: "risingTheme_example1")
    
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
            return risingThemeCategory
        case "title":
            return risingThemeTitle
        case "HashTag":
            return risingThemeSampleHashTag
        case "image":
            return risingThemeImage
        default:
            return nil
        }
    }
}
