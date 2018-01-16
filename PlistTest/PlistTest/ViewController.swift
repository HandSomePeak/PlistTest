//
//  ViewController.swift
//  PlistTest
//
//  Created by 杨峰 on 2018/1/16.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1、在程序运行过程中创建Plist文件，并将其保存在应用程序的沙盒目录中，可以方便进行增删改查。
        self.SavePlistFile()
        
        // 2、归档
        self.coding()
        
        // 3、解归档
        self.encode()
        
        // 4、对自定义数据进行归档
        self.people()
    }
    
    // 4、对自定义数据进行归档
    func people() {
        let homeDicPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let filePath = homeDicPath! + "/people.file"
        
        let people = People()
        people.name = "杨峰"
        people.age = 25
        
        NSKeyedArchiver.archiveRootObject(people, toFile: filePath)
        let peo = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! People
        print("name = \(String(describing: peo.name)), age = \(peo.age)")
    }
    
    // 2、归档
    func coding() {
        // 获取根目录
        let homeDicPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        // 创建文件完整路径
        let filePath = homeDicPath! + "/archiver.file"
        // 将字符串数据进行归档操作
        NSKeyedArchiver.archiveRootObject("杨峰", toFile: filePath)
    }
    
    // 3、解归档
    func encode() {
        // 获取根目录
        let homeDicPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        // 创建文件完整路径
        let filePath = homeDicPath! + "/archiver.file"
        // 进行解归档
        let name = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        print("name = \(String(describing: name))")
    }
    
    // 1、在程序运行过程中创建Plist文件，并将其保存在应用程序的沙盒目录中，可以方便进行增删改查。
    func SavePlistFile() {
        // 获取沙盒的用户数据目录
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        // 拼接上文件名
        let fileName = path! + "/MyPlist.plist"
        let dic:NSDictionary = ["name":"杨峰","age":"25"]
        //进行写文件
        dic.write(toFile: fileName, atomically: true)
        
        // 将存储的Plist文件数据进行读取
        let dicRes = NSDictionary.init(contentsOfFile: fileName)
        print(dicRes ?? "dicRes 为 nil")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

