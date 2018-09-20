//
//  User.swift
//  bicycle
//
//  Created by linkage on 2018/9/14.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit
import YYModel

@objcMembers class User: NSObject {
    public var _id: String?;
    public var name: String?;
    public var email: String?;
    public var userName: String?;
    public var password: String?;
    
    override var description: String{
        return yy_modelDescription()
    }
    
    /**
     * 初期化を行う
     */
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
