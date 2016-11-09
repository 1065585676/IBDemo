//
//  StaticFunctions.swift
//  IBDemo
//
//  Created by wangyuanyuan on 08/11/2016.
//  Copyright © 2016 wangyuanyuan. All rights reserved.
//

import UIKit

class StaticFunctions {
    public static func ShowAlert(atViewController vc: UIViewController, withMsg msg: String) {
        let alertController = UIAlertController(title: "提示", message: msg, preferredStyle: .alert)
        let alertAction     = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        
        vc.present(alertController, animated: false, completion: nil)
    }
}
