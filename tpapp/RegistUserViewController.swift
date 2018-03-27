//
//  RegistUserViewController.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/27.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class RegistUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableData: String // 用于注册用户的属性信息（封装在JSON中）
    var properties: [String]?
    var values: [String : String]?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, tableData: String = "") {
        self.tableData = tableData
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        explanDataToProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBOutlet weak var tableView: UITableView!
    
    private func explanDataToProperties() {
        struct Properties: Codable {
            var properties:[String]
        }
        let decoder = JSONDecoder()
        let pros = try? decoder.decode(Properties.self, from: tableData.data(using: String.Encoding.utf8)!)
        properties = pros?.properties
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RegistTableCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "RegistTableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistTableCell", for: indexPath) as! RegistTableCellTableViewCell
        let pro = properties?[indexPath.row] ?? "unknown"
        cell.TitleLabel.text = pro
        cell.ValueLabel.text = values?[pro] ?? "please complete"
        return cell
    }
    
    @IBAction func SubmitBtnClick(_ sender: UIButton) {
        
        
    }
    
}
