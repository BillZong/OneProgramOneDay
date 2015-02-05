//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by BillZong on 15-1-20.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var  restaurants:[Restaurant] = [
        Restaurant (name: "Cafe Deadend" , type: "Coffee & Tea Shop" , location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong" , image: "cafedeadend.jpg" , isVisited: true ),
        Restaurant (name: "Homei" , type: "Cafe" , location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong" , image: "homei.jpg" , isVisited: false ),
        Restaurant (name: "Teakha" , type: "Tea House" , location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong" , image: "teakha.jpg" , isVisited: false ),
        Restaurant (name: "Cafe loisl" , type: "Austrian / Causual Drink" , location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong" , image: "cafeloisl.jpg" , isVisited: false ),
        Restaurant (name: "Petite Oyster" , type: "French" , location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong" , image: "petiteoyster.jpg" , isVisited: false ),
        Restaurant (name: "For Kee Restaurant" , type: "Bakery" , location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong" , image: "forkeerestaurant.jpg" , isVisited: false ),
        Restaurant (name: "Po's Atelier" , type: "Bakery" , location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong" , image: "posatelier.jpg" , isVisited: false ),
        Restaurant (name: "Bourke Street Backery" , type: "Chocolate" , location: "633 Bourke St Sydney New South Wales 2010 Surry Hills" , image: "bourkestreetbakery.jpg" , isVisited: false ),
        Restaurant (name: "Haigh's Chocolate" , type: "Cafe" , location: "412-414 George St Sydney New South Wales" , image: "haighschocolate.jpg" , isVisited: false ),
        Restaurant (name: "Palomino Espresso" , type: "American / Seafood" , location: "Shop 1 61 York St Sydney New South Wales" , image: "palominoespresso.jpg" , isVisited: false ),
        Restaurant (name: "Upstate" , type: "American" , location: "95 1st Ave New York, NY 10003" , image: "upstate.jpg" , isVisited: false ),
        Restaurant (name: "Traif" , type: "American" , location: "229 S 4th St Brooklyn, NY 11211" , image: "traif.jpg" , isVisited: false ),
        Restaurant (name: "Graham Avenue Meats" , type: "Breakfast & Brunch" , location: "445 Graham Ave Brooklyn, NY 11211" , image: "grahamavenuemeats.jpg" , isVisited: false ),
        Restaurant (name: "Waffle & Wolf" , type: "Coffee & Tea" , location: "413 Graham Ave Brooklyn, NY 11211" , image: "wafflewolf.jpg" , isVisited: false ),
        Restaurant (name: "Five Leaves" , type: "Coffee & Tea" , location: "18 Bedford Ave Brooklyn, NY 11222" , image: "fiveleaves.jpg" , isVisited: false ),
        Restaurant (name: "Cafe Lore" , type: "Latin American" , location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220" , image: "cafelore.jpg" , isVisited: false ),
        Restaurant (name: "Confessional" , type: "Spanish" , location: "308 E 6th St New York, NY 10003" , image: "confessional.jpg" , isVisited: false ),
        Restaurant (name: "Barrafina" , type: "Spanish" , location: "54 Frith Street London W1D 4SL United Kingdom" , image: "barrafina.jpg" , isVisited: false ),
        Restaurant (name: "Donostia" , type: "Spanish" , location: "10 Seymour Place London W1H 7ND United Kingdom" , image: "donostia.jpg" , isVisited: false ),
        Restaurant (name: "Royal Oak" , type: "British" , location: "2 Regency Street London SW1P 4BZ United Kingdom" , image: "royaloak.jpg" , isVisited: false ),
        Restaurant (name: "Thai Cafe" , type: "Thai" , location: "22 Charlwood Street London SW1V 2DY Pimlico" , image: "thaicafe.jpg" , isVisited: false )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
        
        // set autosize cell
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "restaurantCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify, forIndexPath: indexPath) as CustomTableViewCell
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        //        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.layer.frame.size.width / 2
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.layer.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        // TODO: customize the accessoryView
//        cell.accessoryView?.hidden = true

        return cell
    }
    
    // MARK: - Editing

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 255.0 / 255.0, green: 166.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetailSegue") {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let vc = segue.destinationViewController as DetailViewController
                vc.restaurant = restaurants[indexPath.row]
            }
        }
    }
}
