//
//  MasterViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UIScrollViewDelegate {

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
        return UIStatusBarStyle.LightContent
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
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "trophy"), forState: .Normal)        
        button.frame = CGRectMake(self.view.frame.width - 60, self.view.frame.height - 60, 30, 30)
        button.addTarget(self, action: #selector(MasterViewController.backToProgress), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        self.scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollToIndex(index: Int) {        
        UIView.animateWithDuration(0.25, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.scrollView.contentOffset = CGPoint(x: self.view.frame.width * CGFloat(index), y: 0)
        }, completion: nil)
    }
    
    func backToProgress() {
        scrollToIndex(0)
    }
}
