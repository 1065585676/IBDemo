//
//  ViewController.swift
//  IBDemo
//
//  Created by wangyuanyuan on 08/11/2016.
//  Copyright © 2016 wangyuanyuan. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var textField_username: UITextField!
    @IBOutlet weak var textField_password: UITextField!
    @IBOutlet weak var button_login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button_Login_Action(_ sender: AnyObject) {
        let parameters = [
            "WhatToDo": "REQUEST_LOGIN",
            "username": textField_username.text == nil ? "" : textField_username.text!,
            "password": textField_password.text == nil ? "" : textField_password.text!
        ]
        Alamofire.request(URLDefine.loginUrl, method: .post, parameters: parameters, headers: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("Alamofire:\(error)")
                StaticFunctions.ShowAlert(atViewController: self, withMsg: "Alamofire:\(error)")
            case .success(let value):
                let json = JSON(value)
                print("JSON:\(json["result"])")
                if json["result"] == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "LOGINSUCCESS", sender: self)
                    }
                } else {
                    DispatchQueue.main.async {
                        StaticFunctions.ShowAlert(atViewController: self, withMsg: "Login error! Retry!")
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueID = segue.identifier {
            switch segueID {
            case "LOGINSUCCESS":
                let destinationView = segue.destination as! MainViewController
                destinationView.username = textField_username.text!
            default:
                break
            }
        }
    }
}

