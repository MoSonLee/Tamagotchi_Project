//
//  DamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import IQKeyboardManagerSwift

final class DamagotchiMainViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak private var messageImage: UIImageView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var damagotchiLabel: UILabel!
    @IBOutlet weak private var damagotchiLevel: UILabel!
    @IBOutlet weak private var damagotchiImage: UIImageView!
    @IBOutlet weak private var damagotchiFoodTextField: UITextField!
    @IBOutlet weak private var damagatchiWaterTextField: UITextField!
    @IBOutlet weak private var damagotchiFoodButton: UIButton!
    @IBOutlet weak private var damagotchiWaterButton: UIButton!
    
    var tamagtochiImageData: UIImage?
    var tamagotchiTitlText: String?
    var tamagotchiDescription: String?
    
    private var level: Int = 1
    private var rice: Int = 0
    private var water: Int = 0
    private var index: Int = 0
    private var levelText = "level"
    private var riceText = "rice"
    private var waterText = "water"
    private var  messageArray = ["밥 그만줘요", "물 줘요", "배불러요 말걸지 마세요", "밥 시간이에요", "물배찼어요", "집에 가고싶어요"]
    
    private let tamagtochiFirstLevel = 1
    private let keybord = IQKeyboardManager.shared
    private let userDefaults = UserDefaults.standard
    
    static var identifier = "DamagotchiMainViewController"
    static var defaultNickName = "대장님"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UserDefaults.standard.set(true, forKey: .initText)
        getUserDefaults()
        setNavigaiton()
        setLevel()
        setDamaghotchiImage()
        setDamagotchiLevel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        self.navigationItem.setHidesBackButton(true, animated: true)
        damagotchiFoodTextField.delegate = self
        damagatchiWaterTextField.delegate = self
    }
    
    @objc
    private func pushSetting() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as? SettingTableViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setNavigaiton() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .systemGray
        navBarAppearance.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .personCircleImage, style:.plain, target: self, action: #selector(pushSetting))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = userDefaults.string(forKey: .nickname) ?? DamagotchiMainViewController.defaultNickName + "의 다마고치"
    }
    
    private func setLayout() {
        setNavigaiton()
        view.backgroundColor = .backgroundDefaultcolor
        damagotchiFoodTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        messageImage.image = UIImage(named: "bubble")
        setMsessageLabel()
        damagotchiLabel.setLabel(tamagotchiTitlText ?? "")
        setDamagotchiLevel()
        damagotchiFoodTextField.setTextField("밥주세용")
        damagatchiWaterTextField.setTextField("물주세용")
        damagatchiWaterTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        damagotchiFoodButton.setButton("밥먹기")
        damagotchiWaterButton.setButton("물먹기")
        checkDamagotchi()
        keybord.enable = true
        keybord.enableAutoToolbar = false
    }
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        var textedRice: Int?
        textedRice = Int(damagotchiFoodTextField.text!)
        rice += textedRice ?? 1
        setLevel()
        setLayout()
        setUserDefaults()
        setDamaghotchiImage()
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        var textedWater: Int?
        textedWater = Int(damagatchiWaterTextField.text!)
        water += textedWater ?? 1
        setLevel()
        setLayout()
        setUserDefaults()
        setDamaghotchiImage()
    }
    
    @IBAction func keybordDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func setLevel() {
        level = ((rice/5) + water/2) / 10
        if level >= 10 {
            level = 10
        }
    }
    
    private func checkDamagotchi() {
        let name = tamagotchiTitlText
        if name == "따끈따끈 다마고치" {
            index = 1
        } else if name == "방실방실 다마고치" {
            index = 2
        } else if name == "반짝반짝 다마고치" {
            index = 3
        } else { }
    }
    
    private func setDamaghotchiImage() {
        let name = damagotchiLabel.text
        if name == "따끈따끈 다마고치" {
            index = 1
        } else if name == "방실방실 다마고치" {
            index = 2
        } else if name == "반짝반짝 다마고치" {
            index = 3
        } else{}
        
        if level == 0 {
            damagotchiImage.image = UIImage(named: "\(index)-\(1)")
        }
        for i in 1...9 {
            if level == i {
                damagotchiImage.image = UIImage(named: "\(index)-\(i)")
            } else if level == 10 {
                damagotchiImage.image = UIImage(named: "\(index)-\(9)")
            }
        }
    }
    
    private func setUserDefaults() {
        userDefaults.set(level, forKey: self.levelText)
        userDefaults.set(rice, forKey: self.riceText)
        userDefaults.set(water, forKey: self.waterText)
    }
    
    private func getUserDefaults() {
        level = userDefaults.integer(forKey: self.levelText)
        rice = userDefaults.integer(forKey: self.riceText)
        water = userDefaults.integer(forKey: self.waterText)
    }
    
    private func setMsessageLabel() {
        messageLabel.text = messageArray.randomElement()
        messageLabel.numberOfLines = 0
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.textAlignment = .center
    }
    
    private func setDamagotchiLevel() {
        damagotchiLevel.text = ("LV\(level) · 밥알\(rice)개 · 물방울\(water)개")
        damagotchiLevel.textAlignment = .center
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == self.damagotchiFoodTextField  && string.count > 0 {
            let numberOnly = NSCharacterSet.decimalDigits
            let strValid = numberOnly.contains(UnicodeScalar.init(string)!)
            return strValid && text.count <= 3
        }
        return true
    }
}
