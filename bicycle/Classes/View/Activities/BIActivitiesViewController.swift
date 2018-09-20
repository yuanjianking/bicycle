//
//  BIActivitiesViewController.swift
//  bicycle
//
//  Created by linkage on 2018/9/10.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class BIActivitiesViewController: BIBaseViewController {

    private lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension BIActivitiesViewController{
    
    override func setupUI() {
        super.setupUI()
        
        setupTabView()
        tableView?.rowHeight = 120
        
        //tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView?.register(BICustomCell.classForCoder(), forCellReuseIdentifier: cellId)
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
    
    override func loadData() {
        
        let urlString = "http://192.168.60.158:8888/regedit"
        //let params = ["name":"zhangsan","age":29] as [String : AnyObject]
        let params = "{\"userName\": \"admin3\",\"password\": \"123\"}"
//        HttpUtil.shared.request(URLString: urlString, parameters: params){(json, isSuccess) in
//            print(json)
//        }
        HttpUtil.shareInstance.request(methodType: HttpUtil.HTTPMethod.POST, urlString: urlString, parameters: convertStringToDictionary(text: params), resultBlock: {(json, err) in
            if err != nil{
                print(err)
            }else{
                print(json)
            }
        })
        
        // 模拟加载数据
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            for i in 0..<10{
                if self.isPullup {
                    // 追加底部
                    self.statusList.append("上拉\(i)")
                }else{
                    // 下拉刷新
                    self.statusList.insert(i.description, at: 0)
                }
            }
            self.isPullup = false
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 获取cell
        let cell:BICustomCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BICustomCell
        // 设置cell
        cell.updateUI(title: statusList[indexPath.row])
        //cell.textLabel?.text = statusList[indexPath.row]
        // 返回cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index \(indexPath.row)")
        let vc = BIRouteDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
