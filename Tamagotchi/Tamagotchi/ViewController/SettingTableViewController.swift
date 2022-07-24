//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import Toast

final class SettingTableViewController: UITableViewController {
    
    private let settingModel = Setting()
    private let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
    }
    
    @objc
    private func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingModel.settingTextList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        let data = indexPath.row
        cell.configureCell(data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "ChangeNameViewController") as? ChangeNameViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "DamagotchiInitialCollectionViewController") as? DamagotchiInitialCollectionViewController else { return }
            self.navigationController?.navigationBar.tintColor = .black
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let alert =  UIAlertController(title: "데이터초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
            let ok = UIAlertAction(title: "네", style: .default, handler: { _  in
                self.resetData()
            })
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func setNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "설정"
        view.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    private func resetData() {
        userDefaults.set(false, forKey: "init")
        for forKey in userDefaults.dictionaryRepresentation().keys {
            userDefaults.removeObject(forKey: forKey.description)
        }
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        self.view.window?.makeToast("초기화되었습니다! 다마고치를 다시 선택해주세요!")
        //강제적 코드
        if userDefaults.string(forKey: "tamaName") == nil {
            let storyboard = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "DamagotchiInitialCollectionViewController") as? DamagotchiInitialCollectionViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: true)
        }
    }
}
