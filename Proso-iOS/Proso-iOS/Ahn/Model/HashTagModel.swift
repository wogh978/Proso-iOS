//
//  HashTagModel.swift
//  Proso-iOS
//
//  Created by 안지완 on 2022/08/08.
//

// MARK: - HashTag 구조체 선언
import Foundation

struct HashTag{
    let category: String
    let context: String
    
    init(_ categoryInput: String, _ contextInput: String){
        category = categoryInput
        context = contextInput
    }
}

struct HashTagModel{
    let foodHashTag =
    [
        HashTag("food", "분위기 좋은"),
        HashTag("food", "데이트코스"),
        HashTag("food", "점심식사"),
        HashTag("food", "저녁식사"),
        HashTag("food", "맛집"),
        HashTag("food", "회식장소"),
        HashTag("food", "혼밥")
    ]
    
    let cafeHashTag =
    [
        HashTag("cafe", "디저트 맛집"),
        HashTag("cafe", "감성있는"),
        HashTag("cafe", "힐링"),
        HashTag("cafe", "조용한"),
        HashTag("cafe", "데이트코스"),
        HashTag("cafe", "인스타")
    ]
    
    let activityHashTag =
    [
        HashTag("activity", "축제"),
        HashTag("activity", "원데이 클래스"),
        HashTag("activity", "공연"),
        HashTag("activity", "데이트코스"),
    ]
    
    
    func getHashTag(_ category: String) -> [HashTag]{ ///해쉬태그 배열을 가져오기 위한 함수 선언
        switch(category){
        case "food":
            return foodHashTag
        case "cafe":
            return cafeHashTag
        default :
            return activityHashTag
        }
    }
}
