//
//  UICollectionView+Extension.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

extension UICollectionView {
    func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width / 3 - spacing
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        return layout
    }
}
