//
//  BaseView.swift
//  deliver
//
//  Created by JASPRET on 03/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UICollectionViewController{
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "baseViewCell"
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        return cell
    }

}