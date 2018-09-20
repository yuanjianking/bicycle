//
//  BIMainViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BIMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isTranslucent = true
        self.tabBar.backgroundImage = UIImage.init()
        self.tabBar.shadowImage = UIImage.init()
        
        setupChildControllers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// 不能定义属性
extension BIMainViewController{
    
    /// 设置子控制器
    private func setupChildControllers(){
        let array = [
            ["clsName":"BIWelcomeViewController", "title":"", "imageName":""]
        ]
        
        var arrayM = [UIViewController]()
        for dict in array{
            arrayM.append(controll(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    /// 字典创建一个子控制器
    private func controll(dict: [String: String]) -> UIViewController{
        guard let clsName = dict["clsName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type,
            let title = dict["title"],
            let _ = dict["imageName"] else {
                return UIViewController()
        }
        
        // 创建控制器
        let vc = cls.init()
        vc.title = title
        
        let nav = BINavigationController(rootViewController: vc)
        return nav
        
    }
    
}
