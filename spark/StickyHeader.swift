//
//  StickyHeader.swift
//  spark
//
//  Created by Billy Shen on 06/01/2016.
//  Copyright © 2016 Billy Shen. All rights reserved.
//

import UIKit

class StickyHeader: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElementsInRect(rect)
        let offset = collectionView!.contentOffset
        
        if (offset.y < 0) {
            
            let delataY = fabs(offset.y)
            
            for attribues in layoutAttributes! {
                
                if attribues.representedElementKind == UICollectionElementKindSectionHeader {
                    var frame = attribues.frame
                    frame.size.height = max(0, headerReferenceSize.height + delataY)
                    frame.origin.y = CGRectGetMinY(frame) - delataY
                    attribues.frame = frame
                }
                
            }
            
        }
        
        return layoutAttributes
        
    }
    
}