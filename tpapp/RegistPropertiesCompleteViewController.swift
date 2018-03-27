//
//  RegistPropertiesCompleteViewController.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/27.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class RegistPropertiesCompleteViewController: UIViewController {
    
    var proTitle: String
    var backTableView: RegistUserViewController
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, titleName: String = "Unknown", backTableView: RegistUserViewController) {
        self.backTableView = backTableView
        proTitle = titleName
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = proTitle
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueFiled: UITextField!
    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        if sender.tag == 100 { // confirm button
            backTableView.values[proTitle] = valueFiled.text
            backTableView.tableView.reloadData()
        }
        UIApplication.shared.keyWindow?.rootViewController = backTableView
    }
    
    

}
