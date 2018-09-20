//
//  BiWelcomeViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BIWelcomeViewController: BIBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signup(_ sender: UIButton) {
        let vc = BISignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func login(_ sender: UIButton) {
        let vc = BILoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
