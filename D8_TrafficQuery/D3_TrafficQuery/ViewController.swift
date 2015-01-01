//
//  ViewController.swift
//  D3_TrafficQuery
//
//  Created by BillZong on 14-12-28.
//  Copyright (c) 2014年 BillZong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    enum COORDINATION_TYPE: Int {
        case bd09
        case bd09ll
        case gcj02
        case wgs84
    }
    @IBOutlet weak var mapView: UIWebView!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var lineName: UITextField!
    
    @IBAction func pressOK(sender: UIButton) {
        if !cityField.text.isEmpty && !lineName.text.isEmpty {
            lineSearch(0, region: cityField.text, name: lineName.text)
        }
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

        lineSearch(0, region: "广州市", name: "B11")
        
        // TODO: testing, to note them.
//        markThePosition(40.047669, lng: 116.313082, position: "百度奎科大厦")
//        parseTheAddress(zoomLevel: 1, address: "广州市天河区中山大道华港西街60号")
//        reParseTheAddress(coord_type: .gcj02, lat: 39.990912172420714, lng: 116.32715863448607)
        
//        poiSearch(coord_type: .gcj02, lat: 39.990912172420714, lng: 116.32715863448607,
//            radius: 1000, leftTopBound: "39.990911172420714,116.32715763448607",
//            rightBottomBound: "39.990913172420714,116.32715963448607",
//            zoomLevel: 0, region: "上海", locationName: "", query: "海底捞")
    }
    
    private func loadMapViewWithPath(strPath: String)-> Bool {
        mapView.stopLoading()
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
        // Dispose of any resources that can be recreated.
        NSLog("收到内存警告")
    }


}

