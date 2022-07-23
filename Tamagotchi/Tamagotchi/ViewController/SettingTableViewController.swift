//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import Toast

class SettingTableViewController: UITableViewController {
    
    let settingModel = Setting()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
    }
    
    @objc
    func dismissView() {
        self.dismiss(animated: true)
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
        if indexPath.row == 1 {
            let sb = UIStoryboard(name: "DamagotchiInitialStoryboard", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "DamagotchiInitialCollectionViewController") as? DamagotchiInitialCollectionViewController else { return }
            self.navigationController?.navigationBar.tintColor = .black
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 2 {
            let alert =  UIAlertController(title: "데이터초기화.", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
            let ok = UIAlertAction(title: "네", style: .default, handler: { _ in
                self.resetData()
            })
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func setNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "설정"
        view.backgroundColor =  UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func resetData() {
        UserDefaults.standard.removeObject(forKey: "level")
        UserDefaults.standard.removeObject(forKey: "rice")
        UserDefaults.standard.removeObject(forKey: "water")
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.view.window?.makeToast("초기화되었습니다! 다마고치를 다시 선택해주세요!")
    }
}
