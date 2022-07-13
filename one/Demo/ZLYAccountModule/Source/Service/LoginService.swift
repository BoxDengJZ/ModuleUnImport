//
//  LoginService.swift
//  TestAccountModule
//
//  Created by 周凌宇 on 2017/4/21.
//  Copyright © 2017年 LPD. All rights reserved.
//

import UIKit


struct Err: Error{
    
}

class LoginService: NSObject {
    static func login(username: String, password: String, complete: (Error?) -> Void) {
        print("_ login success Ha ha")
        complete(Err())
    }
    
    static func enter(username: String, password: String) -> UIViewController {
        return LoginViewController()
    }
    
    static func validate(username: String, password: String) -> Bool {
        print("login validate success")
        return true
    }
    
}
