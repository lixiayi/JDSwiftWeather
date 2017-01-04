//
//  WeatherDetail.swift
//  JDSwiftWeather
//
//  Created by xiaoyi li on 17/1/4.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDetail: UIViewController {

    var pass_url: String!
    @IBOutlet var temp: UILabel!
    @IBOutlet var sd: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var cityid: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 显示加载框
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "加载中..."
        
        // 请求天气数据信息
        Alamofire.request(pass_url).responseJSON { (DataResponse) in
                  print(DataResponse.data)
            
            if let Json = DataResponse.result.value {
                 print("Json:\(Json) ")
                let dict = try? JSONSerialization.jsonObject(with: DataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                let weather = dict?["weatherinfo"] as! [String :String]
                
                let root = Weatherinfo(fromDictionary: weather as NSDictionary)
                
                DispatchQueue.main.async(execute: { 
                    self.city.text = root.city
                    self.cityid.text = root.cityid
                    self.temp.text = root.temp
                    self.sd.text = root.sD
                    
                    hud.hide(animated: true, afterDelay: 0.8)
                })
            }
        }
    }
}
