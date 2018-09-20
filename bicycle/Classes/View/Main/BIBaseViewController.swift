//
//  BIBaseViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BIBaseViewController: UIViewController {

    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    // 上拉标记
    var isPullup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

}

extension BIBaseViewController{
    
    @objc
    func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        // view 背景
        view.backgroundColor = UIColor.cz_color(withHex: 0xFFFFFF)
        // nav 背景颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.cz_color(withHex: 0x5698FA)
        self.navigationController?.navigationBar.tintColor = UIColor.cz_color(withHex: 0xFFFFFF)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        // 添加导航条
        // view.addSubview(navigationBar)
    }
    
    func setupTabView(){
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - UIApplication.shared.statusBarFrame.height - (self.navigationController?.navigationBar.frame.size.height)!), style: .plain)
        view.addSubview(tableView!)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        // 设置刷新控件
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        loadData()
    }
    
    @objc
    func loadData(){
        
    }
    
    @objc
    func setBottomBorder(textField: UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.cz_color(withHex: 0xCCCCCC).cgColor
        border.frame = CGRect(x:0 ,y:textField.frame.size.height-width, width:textField.frame.size.width, height:textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
}

// 子类负责实现
extension BIBaseViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell:UITableViewCell, forRowAt indexPath: IndexPath){
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        if row == (count - 1) && !isPullup {
            isPullup = true
            print("upload")
            loadData()
        }
        
    }
    
}
