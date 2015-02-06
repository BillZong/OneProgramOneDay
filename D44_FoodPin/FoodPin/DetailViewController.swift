//
//  DetailViewController.swift
//  FoodPin
//
//  Created by BillZong on 15-1-23.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        tableView.backgroundColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 0.2)
        tableView.tableFooterView = UIView(frame: CGRect.zeroRect)
        tableView.separatorColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 0.8)
        
        self.navigationItem.title = restaurant.name
        
        // set autosize cell
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: tableViewDataSource protocol functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantDetailCell", forIndexPath: indexPath) as DetailTableViewCell
        
        switch  indexPath.row  {
        case  0:
            cell.fieldLabel.text  = "Name"
            cell.valueLabel.text  = restaurant.name
        case  1:
            cell.fieldLabel.text  = "Type"
            cell.valueLabel.text  = restaurant.type
        case  2:
            cell.fieldLabel.text  = "Location"
            cell.mapButton.hidden = false
            cell.valueLabel.text  = restaurant.location
        case  3:
            cell.fieldLabel.text  = "Been here"
            cell.valueLabel.text  = (restaurant.isVisited) ? "Yes, I’ve been here before"  : "No"
        default:
            cell.fieldLabel.text  = ""
            cell.valueLabel.text  = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showReview" {
            let vc = segue.destinationViewController as ReviewViewController
            vc.restaurant = restaurant
        } else if segue.identifier == "showMap" {
            let vc = segue.destinationViewController as MapViewController
            vc.restaurant = restaurant
        }
    }

    @IBAction func close(segue: UIStoryboardSegue) {
        
    }

}
