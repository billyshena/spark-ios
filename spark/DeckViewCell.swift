//
//  DeckViewCell.swift
//  spark
//
//  Created by Billy Shen on 06/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class DeckViewCell: UICollectionViewCell {

    @IBOutlet weak var separator: UIView!

    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var owner: UILabel!
    
    @IBOutlet weak var deckName: UILabel!
}
