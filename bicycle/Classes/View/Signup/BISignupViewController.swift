//
//  BISignupViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BISignupViewController: BIBaseViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initView()
    }
    
    @objc
    private func back(){
        // 后退
        self.navigationController?.popViewController(animated: true)
    }

}

extension BISignupViewController{
    
    private func initView(){
        setBottomBorder(textField: name);
        setBottomBorder(textField: email);
        setBottomBorder(textField: userName);
        setBottomBorder(textField: password);
        
        // 自定义的back button
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", target: self, action: #selector(back), isBack: true)
        navigationItem.title = "Signup"
    }
    
    
}
