//
//  BIRouteViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/11.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BIRouteViewController: BIBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinEvent(_ sender: UIButton) {
        let vc = BIActivitiesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func hostEvent(_ sender: UIButton) {
        let vc = BISendRouteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
