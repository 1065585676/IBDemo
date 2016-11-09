//
//  MainViewController.swift
//  IBDemo
//
//  Created by wangyuanyuan on 08/11/2016.
//  Copyright © 2016 wangyuanyuan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var username = ""
    
    var functionArrayIndex = [
        "light",
        "airconditioner",
        "livingroom",
        "home",
        "user",
        "exit",
        "settings"
    ]
    var functionArrayContent = [
        #imageLiteral(resourceName: "light"),
        #imageLiteral(resourceName: "airconditioner"),
        #imageLiteral(resourceName: "livingroom"),
        #imageLiteral(resourceName: "home"),
        #imageLiteral(resourceName: "user"),
        #imageLiteral(resourceName: "exit"),
        #imageLiteral(resourceName: "settings")
    ]
    
    @IBOutlet weak var collectionView_mainContents: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView_mainContents.dataSource = self
        collectionView_mainContents.delegate = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        //StaticFunctions.ShowAlert(atViewController: self, withMsg: "Welcome:\n\t\(username)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return functionArrayContent.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        (cell.viewWithTag(101) as! UIImageView).image = functionArrayContent[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch functionArrayIndex[indexPath.row] {
        case "exit":
            Logout()
        case "light":
            LightController()
        case "airconditioner":
            AirConditionerController()
        case "livingroom":
            LivingRoomController()
        case "home":
            HomeController()
        case "user":
            UserController()
        case "settings":
            SettingsController()
        default:
            print("error")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueID = segue.identifier {
            switch segueID {
            case "LIGHT_DETAIL":
                let destinationVC = segue.destination as! LightViewController
                destinationVC.username = self.username
            case "AIRCONDITIONER_DETAIL":
                let destinationVC = segue.destination as! AirConditionerViewController
                destinationVC.username = self.username
            case "LIVINGROOM_DETAIL":
                let destinationVC = segue.destination as! LivingRoomViewController
                destinationVC.username = self.username
            case "HOME_DETAIL":
                let destinationVC = segue.destination as! HomeViewController
                destinationVC.username = self.username
            case "USER_DETAIL":
                let destinationVC = segue.destination as! UserViewController
                destinationVC.username = self.username
            case "SETTINGS_DETAIL":
                let destinationVC = segue.destination as! SettingsViewController
                destinationVC.username = self.username
            default:
                StaticFunctions.ShowAlert(atViewController: self, withMsg: "")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func Logout() {
        let exitWindow = UIAlertController(title: "Exit", message: "确定要退出登录？", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "Exit", style: .destructive, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        })
        exitWindow.addAction(okAction)
        exitWindow.addAction(defaultAction)
        self.present(exitWindow, animated: false, completion: nil)
    }
    
    func LightController() {
        self.performSegue(withIdentifier: "LIGHT_DETAIL", sender: self)
    }
    
    func AirConditionerController() {
        self.performSegue(withIdentifier: "AIRCONDITIONER_DETAIL", sender: self)
    }
    
    func LivingRoomController() {
        self.performSegue(withIdentifier: "LIVINGROOM_DETAIL", sender: self)
    }

    func HomeController() {
        self.performSegue(withIdentifier: "HOME_DETAIL", sender: self)
    }

    func UserController() {
        self.performSegue(withIdentifier: "USER_DETAIL", sender: self)
    }

    func SettingsController() {
        self.performSegue(withIdentifier: "SETTINGS_DETAIL", sender: self)
    }
    
}
