//
//  App1ViewController.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/17.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class App1ViewController: UIViewController {
    
    let phpFile = dataForServer?["ServerURL"] as? String ?? ""

    override func viewDidLoad() {
        super.viewDidLoad()
        getCountBtnClick(nil)
    }
    
    @IBAction func BackBtnClicked(_ sender: UIButton) {
        let vc = MainViewController(nibName: "MainViewController", bundle: Bundle.main)
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBAction func doCountingBtnClick(_ sender: UIButton) {
        doCounting(appid: 1)
    }
    
    @IBAction func getCountBtnClick(_ sender: UIButton?) {
        getCount(appid: 1) { (count) in
            self.performSelector(onMainThread: #selector(self.changeCountLabel(str:)), with: "\(count)", waitUntilDone: true)
        }
    }
    
    @IBAction func registBtnClick(_ sender: UIButton) {
        getProperties {
    
        }
    }
    
    @objc func changeCountLabel(str: String) {
        countLabel?.text = str;
    }
    
    @IBOutlet var countLabel: UILabel?
    
    func getCount(appid: Int, afterGetData: @escaping (Int) -> () = {(count) in}) {
        print(phpFile)
        if phpFile == "" {return}
        let url = URL(string: phpFile + "?command=countOperationForApp&appid=\(appid)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            if data == nil {return}
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as String?
            let count = Int(str!)
            if count != nil {
                afterGetData(count!)
            }
        }
        task.resume()
    }
    
    func doCounting(appid: Int) {
        let time = NSDate().timeIntervalSince1970
        if phpFile == "" {return}
        let url = URL(string: phpFile + "?command=addOperation&operatingtime=\(time)&userid=1&appid=\(appid)")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: defaultCompleteHandler)
        task.resume()
    }
    
    
    func getProperties(afterGetData: @escaping () -> () = {}) {
        if phpFile == "" {return}
        let url = URL(string: phpFile + "?command=getUserProperties")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if data == nil {return}
            let str = String(data: data!, encoding: String.Encoding.utf8)
            self.performSelector(onMainThread: #selector(self.changeViewToRegistUserView(tableData:)), with: str, waitUntilDone: true)
        }.resume()
    }
    
    @objc func changeViewToRegistUserView(tableData str: String?) {
        let viewController = RegistUserViewController(nibName: "RegistUserViewController", bundle: Bundle.main, tableData: str ?? "")
        viewController.afterSubmit = { (value) in
            let username = value["username"]!
            if self.phpFile == "" {return}
            let url = URL(string: self.phpFile + "?command=addUser&username=" + username)!
            URLSession.shared.dataTask(with: url, completionHandler: defaultCompleteHandler).resume()
            for (pro, val) in value {
                if pro == "username" {continue}
                let url2 = URL(string: self.phpFile + "?command=addUserPropertyValue&" + pro + "=" + val)!
                URLSession.shared.dataTask(with: url2, completionHandler: defaultCompleteHandler).resume()
            }
        }
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    @IBAction func debugTestBtnClick(_ sender: UIButton) {
        changeViewToRegistUserView(tableData: "")
    }
    
}
