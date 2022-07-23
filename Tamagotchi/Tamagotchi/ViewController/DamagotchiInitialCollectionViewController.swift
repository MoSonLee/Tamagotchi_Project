//
//  DamagotchiInitialCollectionViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/22.
//

import UIKit

class DamagotchiInitialCollectionViewController: UICollectionViewController {
    
    private var tamagotchiList = MainTamagotchi()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
        collectionView.collectionViewLayout = collectionView.setCoolectionViewLayout(tamagotchiList.tamagotchi.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tamagotchiList.tamagotchi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DamagotchiInitialCollectionViewCell", for: indexPath) as? DamagotchiInitialCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(tamagotchiList.tamagotchi[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < 3 {
            let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .overFullScreen
            vc.tamagotchiImageData = tamagotchiList.tamagotchi[indexPath.row].tamagotchiImage
            vc.tamagotchiTitlText = tamagotchiList.tamagotchi[indexPath.row].tamagotchiName
            vc.tamagotchiDescription = tamagotchiList.tamagotchi[indexPath.row].tamagotchiDescription
            UserDefaults.standard.set(indexPath.row, forKey: "row")
            self.present(nav, animated: true)
        } else {
            view.makeToast("아직 준비중입니다! 조금만 기다려주세요!!")
        }
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "다마고치 선택하기"
        navigationItem.leftBarButtonItem?.tintColor = .systemGray
    }
}
