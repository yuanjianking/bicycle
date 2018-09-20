//
//  HttpUtil.swift
//  bicycle
//
//  Created by linkage on 2018/9/12.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit
import AFNetworking

class HttpUtil: AFHTTPSessionManager {

    let baseUrl = "http://192.168.60.158:8888/"
    
    enum HTTPMethod {
        case GET
        case POST
    }
    
    static let shareInstance:HttpUtil = {
        let manager = HttpUtil()
        manager.requestSerializer = AFJSONRequestSerializer()
        let setArr = NSSet(objects: "text/html", "application/json", "text/json")
        manager.responseSerializer.acceptableContentTypes = setArr as? Set
        // add HttpHeader
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField:"Content-Type")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField:"Accept")
        manager.requestSerializer.willChangeValue(forKey:"timeoutInterval")
        manager.requestSerializer.timeoutInterval = 30.0
        manager.requestSerializer.didChangeValue(forKey:"timeoutInterval")
        return manager
    }()
    
    func request(methodType:HTTPMethod, urlString:String, parameters: [String:AnyObject]?, resultBlock:@escaping(Any?,Error?)->()) {
        let url = baseUrl + urlString;
        // If the request succeeds, then the error is nil.
        let successBlock = { (task:URLSessionDataTask, responseObj:Any?)in
            resultBlock(responseObj,nil)
        }
        // If the request succeeds, then the error is nil.
        let failureBlock = { (task:URLSessionDataTask?, error:Error)in
            resultBlock(nil, error)
        }
        // request type
        if methodType == HTTPMethod.GET{
            get(url, parameters: parameters, progress:nil, success: successBlock, failure: failureBlock)
        }else{
            post(url, parameters: parameters, progress:nil, success: successBlock, failure: failureBlock)
        }
    }
    
}
