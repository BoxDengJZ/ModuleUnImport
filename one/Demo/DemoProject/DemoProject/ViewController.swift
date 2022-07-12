//
//  ViewController.swift
//  DemoProject
//
//  Created by 周凌宇 on 2017/5/25.
//  Copyright © 2017年 周凌宇. All rights reserved.
//

import UIKit
import ZLYPublicModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // --------- 服务调用 ---------

        // 1. 模块间调用服务
        let lotus = s(AccountLotus.self) // or lotus = kAccountLotus，但需要你管理好 kAccountLotus，尽量不要硬编码
        let accountModule: AccountLotus = LotusootCoordinator.lotusoot(lotus: lotus) as! AccountLotus
        accountModule.login(username: "zhoulingyu", password: "wow") { (error) in
            print(error ?? "")
        }
    }
    
    
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        
        
        
        
        
        
    }
    
    
}

