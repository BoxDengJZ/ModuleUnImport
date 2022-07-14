//
//  LotusootCoordinator.swift
//  LPDBusiness
//
//  Created by 周凌宇 on 2017/4/21.
//  Copyright © 2017年 LPD. All rights reserved.
//

import UIKit
import ZLYPublicModule
import MachO

@objc public class LotusootCoordinator: NSObject {

    
    lazy var moduleNames: [String] = { () -> [String] in
        var result = [String]()
        let cnt = _dyld_image_count()
         for i in 0..<cnt{
             if let tmp = _dyld_get_image_name(i){
                 let name = String(validatingUTF8: tmp)
                 if let candidate = name, candidate.hasPrefix("/Users"){
                     if let tmp = candidate.components(separatedBy: "/").last{
                         print(tmp)
                     }
                 }
                 
             }
         }
         return result
    }()
    
    
    @objc public static let sharedInstance = LotusootCoordinator()
    
    // lotus（协议） 和 lotusoot（实现） 表
    @objc var lotusootMap: Dictionary = Dictionary<String, Any>()
    
    @objc private override init() {
    }
    
    /// 注册 Lotus 和 Lotusoot
    ///
    /// - Parameters:
    ///   - lotusoot: lotusoot 对象。自动注册的 lotusoot 都必须是集成 NSObject，手动注册不做限制
    ///   - lotusName: lotus 协议名
    @objc public static func register(lotusoot: Any, lotusName: String) {
        sharedInstance.lotusootMap.updateValue(lotusoot, forKey: lotusName)
    }
    
    /// 通过 lotus 名称 获取 lotusoot 实例
    ///
    /// - Parameter lotus: lotus 协议名
    /// - Returns: lotusoot 对象
    @objc public static func lotusoot(lotus: String) -> Any? {
        if let val = sharedInstance.lotusootMap[lotus]{
            return val
        }
        else{
            var result: Any? = nil
            var i = 0
            let names = LotusootCoordinator.sharedInstance.moduleNames
            let cnt = names.count
            while i < cnt{
                let classType = NSClassFromString(names[i] + "." + lotus + "C") as? NSObject.Type
                if let type = classType {
                    let lotusoot = type.init()
                    if let maid = lotusoot as? Maid{
                        print(maid.name)
                        register(lotusoot: lotusoot, lotusName: lotus)
                        result = lotusoot
                        LotusootCoordinator.sharedInstance.moduleNames.remove(at: i)
                        break
                    }
                }
                i+=1
            }
            
            return result
        }
    }
    
    /// 注册所有的 lotusoot
    ///
    /// - Parameter serviceMap: 自定义传入的字典
    @objc public static func registerAll(serviceMap: Dictionary<String, String>) {
        for (lotus, lotusootName) in serviceMap {
            let classStringName = lotusootName
            
            let classType = NSClassFromString(classStringName) as? NSObject.Type
            
            if let type = classType {
                let lotusoot = type.init()
                register(lotusoot: lotusoot, lotusName: lotus)
            }
        }
    }
    
    /// 注册所有的 lotusoot
    /// 使用默认生成的 Lotusoot.plist
    @objc public static func registerAll() {
        let lotusPlistPath = Bundle.main.path(forResource: "Lotusoot", ofType: "plist")
        if let lotusPlistPath = lotusPlistPath {
            let map = NSDictionary(contentsOfFile: lotusPlistPath)
            registerAll(serviceMap:  map as! Dictionary<String, String>)
        }
    }
}
