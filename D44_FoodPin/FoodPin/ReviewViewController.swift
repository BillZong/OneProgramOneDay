//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by BillZong on 15-2-5.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // set the dialogView to 0 size.
        //dialogView.transform = CGAffineTransformMakeScale(0, 0)
        // scale animation
        //        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: { () -> Void in
        //            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
        //        }, completion: nil)
        // spring animation
        //        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
        //            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
        //            }, completion: nil)
        // slid-up animation
        //dialogView.transform = CGAffineTransformMakeTranslation(0, 500)
//        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
//            self.dialogView.transform = CGAffineTransformMakeTranslation(0, 0)
//            }, completion: nil)
        // combine the 2 animation together.
        let scale = CGAffineTransformMakeScale(0, 0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
            }, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
