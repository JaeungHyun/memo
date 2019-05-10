//
//  MemoData.swift
//  MyMemory
//
//  Created by JaeUng Hyun on 23/04/2019.
//  Copyright © 2019 JaeUng Hyun. All rights reserved.
//

import UIKit
import CoreData

class MemoData {
    var memoIdx: Int?
    var title: String?
    var contents: String?
    var image: UIImage?
    var regdate: Date?
    var objectID: NSManagedObjectID?
}
