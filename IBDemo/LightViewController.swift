//
//  LightViewController.swift
//  IBDemo
//
//  Created by wangyuanyuan on 09/11/2016.
//  Copyright © 2016 wangyuanyuan. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {

    public var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        StaticFunctions.ShowAlert(atViewController: self, withMsg: "Welcome:\(username)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Button_back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
