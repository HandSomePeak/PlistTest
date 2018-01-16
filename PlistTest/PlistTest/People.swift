//
//  People.swift
//  PlistTest
//
//  Created by 杨峰 on 2018/1/16.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class People: NSObject, NSCoding {
    var name : String?
    var age : NSInteger = 0
    
    override init() {
         super.init()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.age = NSInteger(aDecoder.decodeInt32(forKey: "age"))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(age, forKey: "age")
        aCoder.encode(name, forKey: "name")
    }
    
}
