//
//  DamagotchiInitialCollectionViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

final class DamagotchiInitialCollectionViewController: UICollectionViewController {
    
    private lazy var tamagotchiList = MainTamagotchi()
    private let userDefaults = UserDefaults.standard
    static var identifier = "DamagotchiInitialCollectionViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
        collectionView.backgroundColor = .backgroundDefaultcolor
        collectionView.collectionViewLayout = collectionView.setCollectionViewLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tamagotchiList.tamagotchi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DamagotchiInitialCollectionViewCell.identifier, for: indexPath) as? DamagotchiInitialCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(tamagotchiList.tamagotchi[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < 3 {
            setUserDefaults(indexPath.row)
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: PopUpViewController.identifier) as? PopUpViewController else { return }
            vc.tamagotchiImageData = tamagotchiList.tamagotchi[indexPath.row].tamagotchiImage
            vc.tamagotchiTitlText = tamagotchiList.tamagotchi[indexPath.row].tamagotchiName
            vc.tamagotchiDescription = tamagotchiList.tamagotchi[indexPath.row].tamagotchiDescription
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: true)
        } else {
            view.makeToast("아직 준비중입니다! 조금만 기다려주세요!!")
        }
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "다마고치 선택하기"
        navigationItem.leftBarButtonItem?.tintColor = .systemGray
    }
    
    private func setUserDefaults(_ data: Int) {
        userDefaults.set(tamagotchiList.tamagotchi[data].tamagotchiName, forKey: "tamaName")
        userDefaults.set(tamagotchiList.tamagotchi[data].tamagotchiDescription, forKey: "tamaDescription")
    }
}
