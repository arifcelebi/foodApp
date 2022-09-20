//
//  KategorilerTableViewCell.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit
protocol yemekHucreProtocol {
    
    func buttonTıklandi(indexPath:IndexPath)
    
    
}

class KategorilerTableViewCell: UITableViewCell {

    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekResimImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
}
