//
//  MemoDAO.swift
//  MyMemory
//
//  Created by JaeUng Hyun on 10/05/2019.
//  Copyright © 2019 JaeUng Hyun. All rights reserved.
//

import UIKit
import CoreData

class MemoDAO {
    lazy var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    func fetch(keyword text: String? = nil) -> [MemoData] {
        var memolist = [MemoData]()
        // 1. 요청 객체 생성
        let fetchRequest: NSFetchRequest<MemoMO> = MemoMO.fetchRequest()
        
        // 1-1. 최신 글 순으로 정렬하도록 정렬 객체 생성
        let regdateDesc = NSSortDescriptor(key: "regdate", ascending: false)
        fetchRequest.sortDescriptors = [regdateDesc]
        
        if let t = text, t.isEmpty == false {
            fetchRequest.predicate = NSPredicate(format: "contents CONTAINS[c] %@", t)
        }
        
        do {
            let resultset = try self.context.fetch(fetchRequest)
            
            // 2. 읽어온 결과 집합을 순회하면서 [MemoData] 타입으로 변환한다
            for record in resultset {
                // 3. MemoData 객체를 생성
                let data = MemoData()
                
                // 4. MemoMO 프로퍼티 값을 MemoData의 프로퍼티로 복사
                data.title = record.title
                data.contents = record.contents
                data.regdate = record.regdate! as Date
                data.objectID = record.objectID
                
                // 4-1. 이미지가 있을 때에만 복사
                if let image = record.image as Data? {
                    data.image = UIImage(data: image)
                }
                
                // 5. MemoData 객체를 memolist 배열에 추가
                memolist.append(data)
            }
        } catch let error as NSError {
            NSLog("An error has occurred : %s", error.localizedDescription)
        }
        return memolist
    }
    
    func insert(_ data: MemoData) {
        // 1. 관리 객체 인스턴스 생성
        let object = NSEntityDescription.insertNewObject(forEntityName: "Memo", into: self.context) as! MemoMO
        
        // 2. MemoData로부터 값을 복사한다
        object.title = data.title
        object.contents = data.contents
        object.regdate = data.regdate!
        
        if let image = data.image {
            object.image = image.pngData()!
        }
        
        // 3. 영구 저장소에 변경 사항을 반영
        do {
            try self.context.save()
        } catch let error as NSError {
            NSLog("An error has occurred : %s", error.localizedDescription)
        }
    }
    
    func delete(_ objectID: NSManagedObjectID) -> Bool {
        let object = self.context.object(with: objectID)
        self.context.delete(object)
        
        do {
            try self.context.save()
            return true
        } catch let e as NSError {
            NSLog("An error has occurred : %s" , e.localizedDescription)
            return false
        }
    }
}
