//
//  MainView.swift
//  deliver
//
//  Created by JASPRET on 06/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation

import UIKit

class MainView: UIViewController,UIScrollViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        if(isUserRegistered()){
//            let width=self.view.frame.width
//            let height=self.view.frame.height
//            let base1 = storyboard!.instantiateViewControllerWithIdentifier("baseView1") as! BaseView1;
//            let base2 = storyboard!.instantiateViewControllerWithIdentifier("baseView2") as! BaseView2;
//            scrollView.pagingEnabled=true
//            scrollView.clipsToBounds=false
//
//            scrollView.contentSize = CGSizeMake(width*2+82, height*2)
//            scrollView.contentOffset=CGPointMake(0, 0) 
//            addChildViewController(base1)
//            addChildViewController(base2)
//            scrollView!.addSubview(base1.view)
//            scrollView!.addSubview(base2.view)
//            base1.didMoveToParentViewController(self)
           
            pushToViewController("baseView1")
           
        }else{
            switchToViewController("registerUser")
        }
    }
    func pushToViewController(identifier: String) {
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! BaseView1
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        NSLog("Scrollview content offset %f %f", scrollView.contentOffset.x, scrollView.contentOffset.y)
        NSLog("ScrollView: %@", scrollView)
    }
    
    
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! RegisterView
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }
    
    
    func isUserRegistered() ->Bool{
        
        return Prefrences.getInstance.isUserRegistered()
        
    }
    
   
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
       print("scrollViewWillBeginDecelerating")
    }
    
    
   }