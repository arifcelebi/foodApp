//
//  detayInteractor.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//
import Foundation
import Alamofire

class DetayInteractor:PresenterToInteractorDetayProtocol{
    var DetayPresenter: InteractorToPresenterDetayProtocol?
    
    func yemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let detayListe = [Sepetteki_Yemekler]()
        
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi": "arif"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters:params).response {
            response in
            if let data = response.data{
                do{
                    if let cevap = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                   print(cevap)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        DetayPresenter?.presenteraVeriGönder(sepetteki_yemekler: detayListe)
    }
}
