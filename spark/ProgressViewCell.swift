//
//  ProgressViewCell.swift
//  spark
//
//  Created by Billy Shen on 27/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class ProgressViewCell: UICollectionViewCell {
    
    @IBOutlet weak var answers: UILabel!

    @IBOutlet weak var progressCircle: KDCircularProgress!
    @IBOutlet weak var deckName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
}

