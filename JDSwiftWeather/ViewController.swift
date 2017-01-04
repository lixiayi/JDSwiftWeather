//
//  ViewController.swift
//  JDSwiftWeather
//
//  Created by xiaoyi li on 17/1/4.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit
import PullToRefresh

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!

    // 在这里定义全局数组及其他变量，不用赋值
    var arryDict = [[String: String]]()
    
    var prefix = "http://www.weather.com.cn/data/sk/"
    
    var cityCode:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dic0: [String : String] = ["id" : "101281101", "name":"江门"]
        let dic3:[String : String] = ["id" : "101010100", "name":"北京"]
        let dic1:[String : String] = ["id" : "101200101", "name":"武汉"]
        let dic2:[String : String] = ["id" : "101280101", "name":"广州"]
        let dic4:[String : String] = ["id" : "101280601", "name":"深圳"]
        arryDict.append(dic0)
        arryDict.append(dic1)
        arryDict.append(dic2)
        arryDict.append(dic3)
        arryDict.append(dic4)
        
        setupPullToRefresh()
    }
    
    deinit {
        table.removePullToRefresh(table.bottomPullToRefresh!)
        table.removePullToRefresh(table.topPullToRefresh!)
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func setupPullToRefresh() {
        table.addPullToRefresh(PullToRefresh()) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self?.table.reloadData()
                self?.table.endRefreshing(at: .top)
            }
        }
        
        table.addPullToRefresh(PullToRefresh(position: .bottom)) { [weak self] in
            let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self?.table.reloadData()
                self?.table.endRefreshing(at: .bottom)
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arryDict.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flag = "cityCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: flag)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: flag)
            cell?.textLabel?.text = arryDict[indexPath.row]["name"]
        }
        
        return cell!
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cityCode = arryDict[indexPath.row]["id"]
        let urlstr : URL = URL(string: prefix + self.cityCode + ".html")!
        print(urlstr.absoluteString)
        
        let detail = WeatherDetail(nibName: "WeatherDetail", bundle: nil)
        detail.pass_url = urlstr.absoluteString
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

