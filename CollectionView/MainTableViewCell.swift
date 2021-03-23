//
//  MainTableViewCell.swift
//  CollectionView
//
//  Created by Akula harish on 04/03/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    
    @IBOutlet weak var FNLabel: UILabel!
    
    @IBOutlet weak var LNLabel: UILabel!
    
    @IBOutlet weak var professionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        cellImage.layer.cornerRadius = cellImage.bounds.width/2
    }
    
}
