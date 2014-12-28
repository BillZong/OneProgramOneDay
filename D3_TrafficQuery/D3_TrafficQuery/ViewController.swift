//
//  ViewController.swift
//  D3_TrafficQuery
//
//  Created by BillZong on 14-12-28.
//  Copyright (c) 2014年 BillZong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mapView: UIWebView!
    @IBOutlet weak var cityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadMyPosition(40.047669, lng: 116.313082, position: "百度奎科大厦")
    }
    
    func loadMyPosition(lat: Double, lng: Double, position: String) {
        var strPath = "/marker?location=\(lat),\(lng)&title=" +
            "我的位置&content=\(position)&output=html&src=TrafficQuery"
        if let url = NSURL(scheme: "http", host: "api.map.baidu.com",
            path: strPath) {
                mapView.loadRequest(NSURLRequest(URL: url))
        } else {
            NSLog("failed to get url: %s", strPath)
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        NSLog("收到内存警告")
    }


}

