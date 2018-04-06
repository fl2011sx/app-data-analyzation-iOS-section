//
//  MainViewController.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/17.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func App1BtnClicked(_ sender: UIButton) {
        let vc = App1ViewController(nibName: "App1ViewController", bundle: Bundle.main)
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBOutlet weak var ipAdressFiled: UITextField!
    
    @IBAction func submitBtnClick(_ sender: UIButton) {
        serverURL = "http://" + ipAdressFiled.text! + (dataForServer!["ServerURL"] as! String)
    }
    
    @IBAction func DebugTestBtnClick(_ sender: UIButton) {
        
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
