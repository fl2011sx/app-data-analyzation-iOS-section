//
//  App1ViewController.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/17.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class App1ViewController: UIViewController {
    
    let phpFile = "http://192.168.1.188/tpappCon.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        getCountBtnClick(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @objc func changeCountLabel(str: String) {
        countLabel.text = str;
    }
    
    @IBOutlet weak var countLabel: UILabel!
    
    func getCount(appid: Int, afterGetData: @escaping (Int) -> () = {(count) in}) {
        let url = URL(string: phpFile + "?command=countOperationForApp&appid=\(appid)")!
       let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as String?
        // print(str!) // debug
            let count = Int(str!)
            if count != nil {
                afterGetData(count!)
            }
        }
        task.resume()
    }
    
    func doCounting(appid: Int) {
        let time = NSDate().timeIntervalSince1970
        let url = URL(string: phpFile + "?command=addOperation&operatingtime=\(time)&userid=1&appid=\(appid)")!
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String)
        }
        task.resume()
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
