//
//  ViewController.swift
//  testinterface
//
//  Created by song jiekun on 16/9/12.
//  Copyright © 2016年 song jiekun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!

    @IBOutlet weak var scrollTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.backButton.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func backComment(sender: AnyObject) {
        
        scrollView.layoutIfNeeded()
        
        UIView.animateWithDuration(1, animations: {
            
            self.scrollTopConstraint.constant = 275
            
            self.scrollView.hidden = false
            
            self.scrollView.layoutIfNeeded()
            
            
            self.headerImage.alpha = 1
            
            self.headerImage.hidden = false
            
            }, completion: { (issuccess) in
                
                
                
        })
        
        
        self.backButton.hidden = true
        
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y >= 0 {
            
            self.headerImage.frame.origin.y = -scrollView.contentOffset.y
            
        }
 
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y <= -20  {
            
            scrollView.layoutIfNeeded()
            
            UIView.animateWithDuration(1, animations: {
                
                self.scrollTopConstraint.constant = 800
                
                scrollView.layoutIfNeeded()
                
                
                self.headerImage.alpha = 0
                
                }, completion: { (issuccess) in
                    
                    scrollView.hidden = true
                    self.headerImage.hidden = true
                    self.backButton.hidden = false
                    
            })
            
            //scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, -500), animated: true)
            
            
            
            
            
        }
        
    }
    
    
    
}

