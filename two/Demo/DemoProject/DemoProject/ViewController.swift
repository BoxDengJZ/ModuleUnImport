//
//  ViewController.swift
//  DemoProject
//
//  Created by 周凌宇 on 2017/5/25.
//  Copyright © 2017年 周凌宇. All rights reserved.
//

import UIKit
import ZLYPublicModule


protocol A{

}

protocol B: A{}

extension A{
    func name() -> String {
        return "A"
    }
}


struct AA: A{
    func name() -> String {
        return "A11"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        let lotus = s(AccountLotus.self) // or lotus = kAccountLotus，但需要你管理好 kAccountLotus，尽量不要硬编码
        let accountModule: AccountLotus = LotusootCoordinator.lotusoot(lotus: lotus) as! AccountLotus
        let ctrl = accountModule.enter(username: "zhoulingyu", password: "wow")
        navigationController?.pushViewController(ctrl, animated: true)
        
        
        
        
    }
    
    
}

