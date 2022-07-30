//
//  SettingModel.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit

struct Setting {
    var setting: [SettingModel] = [
        SettingModel(settingText: "내 이름 설정하기", settingRightButtonImage: UIImage(systemName: "chevron.right"), settingFirstImage: UIImage(systemName: "pencil")),
        SettingModel(settingText: "다마고치", settingRightButtonImage: UIImage(systemName: "chevron.right"), settingFirstImage: UIImage(systemName: "moon.fill")),
        SettingModel(settingText: "데이터 초기화", settingRightButtonImage: UIImage(systemName: "chevron.right"), settingFirstImage: UIImage(systemName: "arrow.clockwise"))
    ]
}
