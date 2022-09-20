//
//  SepetTableViewCell.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

  
    @IBOutlet weak var sepetImageView: UIImageView!
    @IBOutlet weak var sepetYemekAdi: UILabel!
    
    @IBOutlet weak var sepetYemekFiyati: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
