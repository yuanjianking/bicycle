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
    
    private lazy var loginModel = LoginResultModel()
    
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

    @IBAction func signup(_ sender: UIButton) {
        let user = User.init()
        user.name = self.name.text;
        user.email = self.email.text;
        user.userName = self.userName.text;
        user.password = self.password.text;
        
        loginModel.signup(user: user){(result: LoginResult)->() in
            if result.code == 1{
                CBToast.showToastAction(message: "signup success")
            }else{
                CBToast.showToastAction(message: "signup error")
            }
        }
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
