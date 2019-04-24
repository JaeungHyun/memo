//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by JaeUng Hyun on 23/04/2019.
//  Copyright © 2019 JaeUng Hyun. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    // 콘텐츠를 저장하는 변수
    var param: MemoData?
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        // 1. 제목과 내용, 이미지를 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 2. 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // 3. 내비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dateString
        
        
    }
    
}
