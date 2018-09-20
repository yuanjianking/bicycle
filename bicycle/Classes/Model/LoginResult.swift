//
//  LoginResult.swift
//  bicycle
//
//  Created by linkage on 2018/9/14.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit
import YYModel

@objcMembers class LoginResult: NSObject {
    public var code: Int = 0
    public var message: String?
    public var content: User?
    
    override var description: String{
        return yy_modelDescription()
    }
    
    public override init() {
        super.init()
    }
    
    internal init(dict: [String: AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override public func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
