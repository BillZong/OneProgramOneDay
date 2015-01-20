//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by BillZong on 15-1-20.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var  restaurantNames = [ "Cafe Deadend" , "Homei" , "Teakha" , "Cafe Loisl" , "Petite Oyster" , "For Kee Restaurant" , "Po's Atelier" , "Bourke Street Bakery" , "Haigh's Chocolate" , "Palomino Espresso" , "Upstate" , "Traif" , "Graham Avenue Meats" , "Waffle & Wolf" , "Five Leaves" , "Cafe Lore" , "Confessional" , "Barrafina" , "Donostia" , "Royal Oak" , "Thai Cafe" ]
    
    var  restaurantImages = [ "cafedeadend.jpg" , "homei.jpg" , "teakha.jpg" , "cafeloisl.jpg" , "petiteoyster.jpg" , "forkeerestaurant.jpg" , "posatelier.jpg" , "bourkestreetbakery.jpg" , "haighschocolate.jpg" , "palominoespresso.jpg" , "upstate.jpg" , "traif.jpg" , "grahamavenuemeats.jpg" , "wafflewolf.jpg" , "fiveleaves.jpg" , "cafelore.jpg" , "confessional.jpg" , "barrafina.jpg" , "donostia.jpg" , "royaloak.jpg" , "thaicafe.jpg" ]
    
    var  restaurantLocations = [ "Hong Kong" , "Hong Kong" , "Hong Kong" , "Hong Kong" , "Hong Kong" , "Hong Kong" , "Hong Kong" , "Sydney" , "Sydney" , "Sydney" , "New York" , "New York" , "New York" , "New York" , "New York" , "New York" , "New York" , "London" , "London" , "London" , "London" ]
    
    var  restaurantTypes = [ "Coffee & Tea Shop" , "Cafe" , "Tea House" , "Austrian / Causual Drink" , "French" , "Bakery" , "Bakery" , "Chocolate" , "Cafe" , "American / Seafood" , "American" , "American" , "Breakfast & Brunch" , "Coffee & Tea" , "Coffee & Tea" , "Latin American" , "Spanish" , "Spanish" , "Spanish" , "British" , "Thai" ]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "restaurantCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify, forIndexPath: indexPath) as CustomTableViewCell
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        //        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.layer.frame.size.width / 2
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.layer.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        // TODO: customize not done yet.
//        cell.accessoryView?.hidden = true
        
        return cell
    }
    
    // MARK: - Selection
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: nil, message: "Sorry, ther is no such number: 123-\(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "call " + "123-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let isVisitedAction = UIAlertAction(title: restaurantIsVisited[indexPath.row] ? "No, It's new for me" :"I've visited",
            style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
                let cell = self.tableView.cellForRowAtIndexPath(indexPath)
                
                cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .Checkmark : .None
                
        })
        optionMenu.addAction(isVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    // MARK: - Editing

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
