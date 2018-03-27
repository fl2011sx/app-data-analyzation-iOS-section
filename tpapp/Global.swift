//
//  Global.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/22.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import Foundation

let dataForServer = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "DataForServer", ofType: "plist") ?? "")

let defaultCompleteHandler: (Data?, URLResponse?, Error?) -> () = { (data, res, err) in
    if data == nil {return}
    print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String)
}

