//
//  BILoginViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BILoginViewController: BIBaseViewController {

    private lazy var loginModel = LoginResultModel()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setBottomBorder(textField: userName);
        setBottomBorder(textField: password);
    }
    
    @objc
    private func back(){
        // 后退
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        let user = User.init()
        user.userName = self.userName.text;
        user.password = self.password.text;
        
        loginModel.login(user: user){(result: LoginResult)->() in
            if result.code == 1{
                CBToast.showToastAction(message: "login success")
                let vc = BIRouteViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                CBToast.showToastAction(message: "login error")
            }
        }
        
    }
    
}

extension BILoginViewController{
    
    override func setupUI() {
        super.setupUI()
        
        setBottomBorder(textField: userName);
        setBottomBorder(textField: password);
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", target: self, action: #selector(back), isBack: true)
        navigationItem.title = "Login"
    }
}
