//
//  AppDelegate.swift
//  DemoProject
//
//  Created by 周凌宇 on 2017/5/25.
//  Copyright © 2017年 周凌宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 通过 Build 阶段自动生成的 Lotusoot.plist 注册
        LotusootCoordinator.registerAll()
        // 可以继续手动添加注册
        LotusootCoordinator.register(lotusoot: MainLotusoot(), lotusName: "MainLotus")
        return true
    }

}



// 编译不更新，就改包名
