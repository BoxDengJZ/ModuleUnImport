//
//  AppDelegate.swift
//  DemoProject
//
//  Created by 周凌宇 on 2017/5/25.
//  Copyright © 2017年 周凌宇. All rights reserved.
//

import UIKit
import ZLYPublicModule


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 通过 Build 阶段自动生成的 Lotusoot.plist 注册
        LotusootCoordinator.registerAll()
        // 可以继续手动添加注册
        LotusootCoordinator.register(lotusoot: MainLotusoot(), lotusName: "MainLotus")
        
        printMethodNamesForClass(cls: Maid.self)
        
        return true
    }

}



// 编译不更新，就改包名



func printMethodNamesForClass(cls: AnyClass) {
    var methodCount: UInt32 = 0
    let methodList = class_copyMethodList(cls, &methodCount)
    if let methodList = methodList, methodCount > 0 {
        enumerateCArray(array: methodList, count: methodCount) { i, m in
            let name = methodName(m: m) ?? "unknown"
            print("#\(i): \(name)")
        }

        free(methodList)
    }
}
func enumerateCArray<T>(array: UnsafePointer<T>, count: UInt32, f: (UInt32, T) -> Void) {
    var ptr = array
    for i in 0..<count {
        f(i, ptr.pointee)
        ptr = ptr.successor()
    }
}
func methodName(m: Method) -> String? {
    let sel = method_getName(m)
    let nameCString = sel_getName(sel)
    return String(cString: nameCString)
}
