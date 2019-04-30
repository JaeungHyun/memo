//
//  CSLogButton.swift
//  MyMemory
//
//  Created by JaeUng Hyun on 30/04/2019.
//  Copyright © 2019 JaeUng Hyun. All rights reserved.
//

import UIKit

public enum CSLogType: Int {
    case basic
    case title
    case tag
}

public class CSLogButton: UIButton {
    // 로그 출력 타입
    public var logType: CSLogType = .basic
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = UIColor.white
        
        // 버튼의 클릭 이벤트에 logging(_:) 메소드 연결
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    // 로그를 기록하는 메소드 정의
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
        case .basic:
            NSLog("버튼이 클릭되었습니다")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"
            NSLog("\(btnTitle)")
        case .tag:
            NSLog("\(sender.tag) 버튼이 클릭되었습니다")
        }
    }
}
