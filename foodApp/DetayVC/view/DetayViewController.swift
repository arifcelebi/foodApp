//
//  detayViewController.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit
import Alamofire
import Kingfisher


class DetayViewController: UIViewController {

  
   
    @IBOutlet weak var detayFiyatLabel: UILabel!
    
    
    @IBOutlet weak var detayImageView: UIImageView!
    
    
    var yemek:Yemekler?
    
    var yemekListe:Sepetteki_Yemekler?
    
    var detayPresenterNesenesi:ViewToPresenterDetayProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extendedLayoutIncludesOpaqueBars = true

        detayRouter.createModule(ref: self)
        
        if let y = yemek {
         
            self.navigationItem.title = y.yemek_adi!
            detayImageView.image = UIImage(named: y.yemek_resim_adi!)
            detayFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
        }
        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek?.yemek_resim_adi! ?? "")")
        detayImageView.kf.setImage(with: yemekResim)
        
    }
    

   
    @IBAction func detaySepeteEkle(_ sender: Any) {
        
        detayPresenterNesenesi?.ekle(yemek_adi: yemek!.yemek_adi!, yemek_resim_adi: yemek!.yemek_resim_adi!, yemek_fiyat: yemek!.yemek_fiyat!, yemek_siparis_adet: "1", kullanici_adi: "arif")
        
        
    }
}
