//
//  SettingModel.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit

struct Setting {
    var settingTextList = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    var settingFirstImage = [
        UIImage(systemName: "pencil"),
        UIImage(systemName: "moon.fill"),
        UIImage(systemName: "arrow.clockwise")
    ]
    var settingRightButton = UIImage(systemName: "chevron.right")
    var settingRighButtonText = ["\(DamagotchiMainViewController.nickName) ", "", ""]
}
