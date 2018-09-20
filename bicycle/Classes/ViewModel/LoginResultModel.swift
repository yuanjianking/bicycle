//
//  LoginResultModel.swift
//  bicycle
//
//  Created by linkage on 2018/9/14.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import Foundation

class LoginResultModel{
    
    func login(user: User){
        let urlString = "login"
        
        HttpUtil.shareInstance.request(methodType: HttpUtil.HTTPMethod.POST, urlString: urlString, parameters: convertStringToDictionary(text: user.yy_modelToJSONString()!), resultBlock: {(json, err) in
            if err != nil{
                print(err)
            }else{
                print(json)
                // 字典转模型
                let loginResult: LoginResult = LoginResult(dict: json as! [String : AnyObject])
                print(String(loginResult.code) + loginResult.message!)
                
                // 字典转模型
                let r = LoginResult()
                r.yy_modelSet(with: json as! [String : AnyObject])
                
                print(r.content?.email)
                print(r.content?._id)
                
            }
        })
    }
    
    // json -> 字典
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
}
