//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import Toast

final class SettingTableViewController: UITableViewController {
    
    private lazy var settingModel = Setting()
    private let userDefaults = UserDefaults.standard
    static var identifier = "SettingTableViewController"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
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
        settingModel.setting.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        let data = indexPath.row
        cell.settingRightButton.setTitle("", for: .normal)
        cell.configureCell(data)
        if data == 0 {
            cell.settingRightButton.setTitle(userDefaults.string(forKey: .nickname) ?? DamagotchiMainViewController.defaultNickName, for: .normal)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ChangeNameViewController.identifier) as? ChangeNameViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: DamagotchiInitialCollectionViewController.identifier) as? DamagotchiInitialCollectionViewController else { return }
            self.navigationController?.navigationBar.tintColor = .black
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            self.showAlert(title: "데이터초기화", message: "정말 다시 처음부터 시작하실 건가용?") { _ in
                self.resetData()
            }
            
        default:
            return
        }
    }
    
    private func setNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .chevornLeftImage, style:.plain, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "설정"
        view.backgroundColor = .backgroundDefaultcolor
    }
    
    private func resetData() {
        userDefaults.set(false, forKey: .initText)
        for forKey in userDefaults.dictionaryRepresentation().keys {
            userDefaults.removeObject(forKey: forKey.description)
        }
        guard let vc = self.storyboard?.instantiateViewController(identifier: DamagotchiInitialCollectionViewController.identifier) as? DamagotchiInitialCollectionViewController else{ return }
        let nav = UINavigationController(rootViewController: vc)
        self.changeRootViewController(nav)
        self.view.window?.makeToast("초기화되었습니다! 다마고치를 다시 선택해주세요!")
    }
}
