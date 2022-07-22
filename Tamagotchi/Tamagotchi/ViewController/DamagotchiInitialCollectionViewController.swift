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
        let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        self.present(nav, animated: true)
        UserDefaults.standard.set(tamagotchiList.tamagotchi[indexPath.row].tamagotchiName, forKey: "tamagotchiName")
        UserDefaults.standard.set(tamagotchiList.tamagotchi[indexPath.row].tamagotchiDescription, forKey: "tamagochiDescription")
        setImage(image: tamagotchiList.tamagotchi[indexPath.row].tamagotchiImage!)
        
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    func setImage(image : UIImage) {
        UserDefaults.standard.set(image.jpegData(compressionQuality: 100), forKey: "damagotchiImage")
    }
    
}
