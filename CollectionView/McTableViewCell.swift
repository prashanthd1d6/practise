//
//  McTableViewCell.swift
//  CollectionView
//
//  Created by Akula harish on 05/03/21.
//

import UIKit

class McTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var McImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
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
        McImageView.layer.cornerRadius = McImageView.bounds.width/2
        mainLabel.font = UIFont(name: "COPPERPLATE", size: 25)
        
        FNLabel.font = UIFont(name: "COPPERPLATE", size: 20)
        LNLabel.font = UIFont(name: "COPPERPLATE", size: 20)
        professionLabel.font = UIFont(name: "COPPERPLATE", size: 20)

    }
    
}
