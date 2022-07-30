//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 이승후 on 2022/07/25.
//

import UIKit

extension UIViewController {
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert =  UIAlertController(title: title , message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
        let ok = UIAlertAction(title: "네", style: .default, handler: handler)
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
