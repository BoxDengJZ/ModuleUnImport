//
//  AccountLotus.swift
//  TestAccountModule
//
//  Created by 周凌宇 on 2017/4/24.
//  Copyright © 2017年 周凌宇. All rights reserved.
//  对外公布 Module 有哪些可掉方法

import UIKit

public protocol AccountLotus {
    
    func login(username: String, password: String, complete: (Error?) -> Void)
    func enter(username: String, password: String) -> UIViewController
    
    
    func register(username: String, password: String, complete: (Error?) -> Void)
    func email(username: String) -> String
    func showLoginVC(username: String, password: String)
}


public protocol Maid{
    var name: String{ get }
}
 
