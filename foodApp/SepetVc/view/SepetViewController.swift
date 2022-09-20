//
//  SepetViewController.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import UIKit
import Alamofire
import Kingfisher


class SepetViewController: UIViewController {
    
    var sepetListesi = [Sepetteki_Yemekler]()
    var toplam = 0
    
    var SepetPresenterNesnesi:ViewToPresenterSepetProtocol?


    @IBOutlet weak var sepetToplamFiyat: UILabel!
    @IBOutlet weak var sepetToplam: UILabel!
 
    @IBOutlet weak var sepetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        
        SepetRouter.createModule(ref: self)
        

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
      SepetPresenterNesnesi?.getir(kullanici_adi: "arif") 
    }
    

    
    @IBAction func OnaylaButton(_ sender: Any) {
    }
    
   

}
extension SepetViewController:PresenterToViewSepetProtocol{
    func vieweVeriGönder(sepetteki_yemekler: Array<Sepetteki_Yemekler>) {
        
            self.sepetListesi = sepetteki_yemekler
        
            toplam = 0
            if !sepetteki_yemekler.isEmpty {
                for yemek in sepetteki_yemekler {
                    if let Price = yemek.yemek_fiyat, let Count = yemek.yemek_siparis_adet, let p = Int(Price), let c = Int(Count) {
                        toplam += p * c
                       sepetToplamFiyat.text = "\(toplam) ₺"
                    }
                }
            }else{
                let toplam:Int = 0
                self.sepetToplamFiyat.text = "\(toplam) ₺"
            }
        
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            print(self.toplam)

          
        }
        
    }
}

extension SepetViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepetListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        
        hucre.sepetImageView.kf.setImage(with: yemekResim)
        hucre.sepetYemekAdi.text = yemek.yemek_adi
        hucre.sepetYemekFiyati.text = "\(yemek.yemek_fiyat!) ₺"
        
        return hucre
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { [self]
            (UIContextualAction,view,bool) in
            
            let yemek = self.sepetListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) Ürünü Silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal Et", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ [self] action
                in
                
                self.SepetPresenterNesnesi?.sil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi:"arif")
                
                }
            alert.addAction(evetAction)
            
            self.present(alert, animated:true)
        }
        return UISwipeActionsConfiguration(actions: [silAction] )

}

    
}
