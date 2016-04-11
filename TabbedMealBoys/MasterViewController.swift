//
//  MasterViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var pages: [UIViewController] = []
    
    func attachSlide(newSlide: UIViewController, slideNumber: Int) {
        self.addChildViewController(newSlide)
        self.scrollView.addSubview(newSlide.view)
        newSlide.didMoveToParentViewController(self)
        
        if (slideNumber > 1) {
            var frame : CGRect = newSlide.view.frame
            frame.origin.x = self.view.frame.width * CGFloat(slideNumber - 1)
            newSlide.view.frame = frame
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        //LightContent
        return UIStatusBarStyle.LightContent
        
        //Default
        //return UIStatusBarStyle.Default
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pages.append(ProgressViewController())
        pages.append(PlanTableViewController())
        pages.append(NomsTableViewController())
        pages.append(AddNomViewController())
        pages.append(ProfileViewController())
        
        for (index, page) in pages.enumerate() {
            attachSlide(page, slideNumber: index + 1)
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * CGFloat(pages.count), self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollToIndex(index: Int) {        
        UIView.animateWithDuration(0.25, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.scrollView.contentOffset = CGPoint(x: self.view.frame.width * CGFloat(index), y: 0)
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
