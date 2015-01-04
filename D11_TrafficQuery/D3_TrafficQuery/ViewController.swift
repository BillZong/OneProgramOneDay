//
//  ViewController.swift
//  D3_TrafficQuery
//
//  Created by BillZong on 14-12-28.
//  Copyright (c) 2014年 BillZong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    enum COORDINATION_TYPE: Int {
        case bd09
        case bd09ll
        case gcj02
        case wgs84
    }
    
    @IBOutlet weak var mapView: UIWebView!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var lineName: UITextField!
    
    // TODO: how to close the keyboad when press the return button and do the research.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == lineName {
            lineName.resignFirstResponder()
            lineSearchUsingTextField()
        }
        
        return true
    }
    
    private func lineSearchUsingTextField() {
        if !cityField.text.isEmpty && !lineName.text.isEmpty {
            lineSearch(0, region: cityField.text, name: lineName.text)
        }
    }
    
    @IBAction func pressOK(sender: UIButton) {
        lineName.resignFirstResponder()
        lineSearchUsingTextField()
    }
    
    // MARK: Most important func
    func lineSearch(zoomLevel: Int, region: String, name: String)-> Bool {
        var strPath = "/line?region=\(region)&name=\(name)" +
            "&output=html&src=TrafficQuery"
        
        return loadMapViewWithPath(strPath)
    }
    
    // MARK: Not so important func below.
    func directionSearch()-> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineName.delegate = self
    }
    
    private func loadMapViewWithPath(strPath: String)-> Bool {
        mapView.stopLoading()
        var ret = false
        if let url = NSURL(scheme: "http", host: "api.map.baidu.com",
            path: strPath) {
                mapView.loadRequest(NSURLRequest(URL: url))
                ret = true
        } else {
            NSLog("failed to get url: \(strPath)")
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
        var strPath = "/geocoder?address=\(address)" +
            "&output=html&src=TrafficQuery"
        
        return loadMapViewWithPath(strPath)
    }
    
    func reParseTheAddress(coord_type: COORDINATION_TYPE = .bd09,
        lat: Double, lng: Double)-> Bool {
            var strPath = "/geocoder?location=\(lat),\(lng)" +
                "&coord_type=\(coord_type.rawValue)" +
                "&output=html&src=TrafficQuery"
            
            return loadMapViewWithPath(strPath)
    }
    
    func poiSearch(coord_type: COORDINATION_TYPE = .bd09, lat: Double, lng: Double,
        radius: Double, leftTopBound: String, rightBottomBound: String, zoomLevel: Int, region: String,
        locationName: String, query: String)-> Bool {
            var strPath = "/place/search?query=\(query)&location=latlng:\(lat),\(lng)" +
                "|name:\(locationName)&radius=\(radius)&region=\(region)" +
                "&output=html&src=TrafficQuery"
            
            return loadMapViewWithPath(strPath)
    }
    
    // Todo: not done yet
    func poiDetail(zoomLevel: Int, uid: String)-> Bool {
        var strPath = "/place/detail?uid=\(uid)" +
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
        NSLog("收到内存警告")
    }
}

