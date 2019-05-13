//
//  Utils.swift
//  MyMemory
//
//  Created by JaeUng Hyun on 03/05/2019.
//  Copyright © 2019 JaeUng Hyun. All rights reserved.
//

extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
    
    func alert(_ message: String, completion: (()-> Void)? = nil) {
        // 메인 쓰레드에서 실행되도록 비동기 처리
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                completion?() // completion이 nil 이 아닐때만 실행
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
