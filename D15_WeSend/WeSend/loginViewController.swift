//
//  loginViewController.swift
//  WeSend
//
//  Created by BillZong on 15-1-4.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var serverTF: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as NSObject == doneButton {
            NSUserDefaults.standardUserDefaults().setObject(accountTF.text, forKey: "WeinxinId")
            NSUserDefaults.standardUserDefaults().setObject(passwordTF.text, forKey: "WeixinPw")
            NSUserDefaults.standardUserDefaults().setObject(serverTF.text, forKey: "WeixinServer")
        }
    }
}
