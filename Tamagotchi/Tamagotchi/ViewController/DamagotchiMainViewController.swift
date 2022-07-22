//
//  DamagotchiMainViewController.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/23.
//

import UIKit
import Toast
import IQKeyboardManagerSwift

class DamagotchiMainViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var damagotchiLabel: UILabel!
    @IBOutlet weak var damagotchiLevel: UILabel!
    @IBOutlet weak var damagotcjiImage: UIImageView!
    @IBOutlet weak var damagotchiFoodTextField: UITextField!
    @IBOutlet weak var damagatchiWaterTextField: UITextField!
    @IBOutlet weak var damagotchiFoodButton: UIButton!
    @IBOutlet weak var damagotchiWaterButton: UIButton!
    private var level: Int = 0
    private var rice: Int = 0
    private var water: Int = 0
    
    static var nickName: String = "대장님"
    private let messageArray: [String] = ["밥 그만줘요 \(nickName)", "물 줘요 \(nickName)", "배불러요 말걸지 마세요 \(nickName)", "밥 시간이에요 \(nickName)"]
    
    override func viewDidLoad() {
        damagotchiFoodTextField.delegate = self
        damagatchiWaterTextField.delegate = self
        super.viewDidLoad()
        setLayout()
    }
    @objc
    func a() {
        
    }
    
    func setNavigationBarUnderLine() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .systemGray
        navBarAppearance.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    func setLayout() {
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style:.plain, target: self, action: #selector(a))
        
        messageLabel.text = messageArray.randomElement()
        messageLabel.numberOfLines = 0
        messageLabel.adjustsFontSizeToFitWidth = true
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.title = DamagotchiMainViewController.nickName + "의 다마고치"
        damagotchiFoodTextField.placeholder = "밥주세용"
        damagotchiFoodTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        damagotchiFoodTextField.keyboardType = .decimalPad
        messageImage.image = UIImage(named: "bubble")
        messageLabel.textAlignment = .center
        damagotcjiImage.image = getImage()
        damagotchiLabel.text =  UserDefaults.standard.string(forKey: "tamagotchiName")
        damagotchiLabel.textAlignment = .center
        damagotchiLabel.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        damagotchiLabel.layer.borderWidth = 1
        damagotchiLabel.font = .preferredFont(forTextStyle: .callout, compatibleWith: .none)
        damagotchiLabel.layer.cornerRadius = 3
        damagotchiLabel.adjustsFontSizeToFitWidth = true
        damagotchiLevel.text = ("LV\(level) · 밥알\(rice)개 · 물방울\(water)개")
        damagotchiLevel.textAlignment = .center
        damagotchiLabel.font = .systemFont(ofSize: 14)
        damagatchiWaterTextField.textAlignment = .center
        damagotchiFoodTextField.borderStyle = .none
        damagatchiWaterTextField.keyboardType = .decimalPad
        
        damagatchiWaterTextField.placeholder = "물주세용"
        damagatchiWaterTextField.borderStyle = .none
        damagotchiFoodTextField.textAlignment = .center
        damagatchiWaterTextField.addBottomBorderWithColor(color: .systemGray, width: 1)
        damagotchiFoodButton.tintColor = .systemGray
        damagotchiFoodButton.setImage(UIImage(named: "water"), for: .normal)
        damagotchiFoodButton.setTitle("밥먹기", for: .normal)
        damagotchiWaterButton.tintColor = .systemGray
        damagotchiWaterButton.setTitle("물먹기", for: .normal)
        setNavigationBarUnderLine()
    }
    
    func getImage() -> UIImage? {
        if let imageData = UserDefaults.standard.value(forKey: "damagotchiImage") as? Data{
            if let imageFromData = UIImage(data: imageData) {
                return imageFromData
            }
        }
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == self.damagotchiFoodTextField  && string.count > 0{
            let numberOnly = NSCharacterSet.decimalDigits
            let strValid = numberOnly.contains(UnicodeScalar.init(string)!)
            return strValid && text.count <= 10
        }
        return true
    }
}
