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
        let lotus = s(AccountLotus.self)
        let accountModule = LotusootCoordinator.lotusoot(lotus: lotus)
    }
    
    
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        let lotus = s(AccountLotus.self)
        let accountModule: AccountLotus = LotusootCoordinator.lotusoot(lotus: lotus) as! AccountLotus
        let ctrl = accountModule.enter(username: "zhoulingyu", password: "wow")
        navigationController?.pushViewController(ctrl, animated: true)
        
        
        
        
    }
    
    
}

