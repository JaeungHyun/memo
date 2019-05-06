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
}
