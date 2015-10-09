//
//  BaseView.swift
//  deliver
//
//  Created by JASPRET on 03/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit

class BaseView1: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var pageIndex : Int = 2
    var titleText : String = ""
    
    override func viewDidLoad() {
        
        self.title="Select an Item"
        
        screenWidth = self.view.frame.width
        screenHeight = self.view.frame.height
       
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView!.setCollectionViewLayout(layout, animated: false)
        self.collectionView!.backgroundColor = UIColor.greenColor()
        self.collectionView!.frame = CGRectMake (0,0,screenWidth/2,screenHeight)
        self.collectionView?.reloadData()
    }
    
    
    

    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
   override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseViewCell1", forIndexPath: indexPath) as! BaseViewCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth =  0.5
        cell.frame.size.width = (screenWidth / 3)-0.8
        cell.frame.size.height = screenWidth / 3
    
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
     
        return CGSize(width: screenWidth/3, height: screenWidth/3);
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.title="item : \(indexPath.item+1)"
        pushToViewController("landingView")
    }
    
    func pushToViewController(identifier: String) {
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! LandingView
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
       
}