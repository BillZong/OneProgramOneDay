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

        // TODO: testing, to delete
        markThePosition(40.047669, lng: 116.313082, position: "百度奎科大厦")
//        parseTheAddress(zoomLevel: 1, address: "广州市天河区中山大道华港西街60号")
    }
    
    private func loadMapViewWithPath(strPath: String)-> Bool {
        var ret = false
        if let url = NSURL(scheme: "http", host: "api.map.baidu.com",
            path: strPath) {
                mapView.loadRequest(NSURLRequest(URL: url))
                ret = true
        } else {
            NSLog("failed to get url: %s", strPath)
        }
        return ret
    }
    
    func markThePosition(lat: Double, lng: Double, position: String)-> Bool {
        var strPath = "/marker?location=\(lat),\(lng)&title=" +
            "我的位置&content=\(position)&output=html&src=TrafficQuery"

        return loadMapViewWithPath(strPath)
    }
    
    // Todo: The zoomLevel doesn't work.
    func parseTheAddress(zoomLevel: Int = 0, address: String)-> Bool {
//        var strPath = "/geocoder?address=\(address)&zoom=\(zoomLevel)" +
//            "&output=html&src=TrafficQuery"
        var strPath = "/geocoder?address=\(address)" +
            "&output=html&src=TrafficQuery"
        
        return loadMapViewWithPath(strPath)
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

