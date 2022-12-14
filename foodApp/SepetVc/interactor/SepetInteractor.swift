//
//  SepetInteracotr.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import Foundation
import Alamofire
import Kingfisher

class SepetInteractor:PresenterToInteractorSepetProtocol{
    var SepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepetiGetir(kullanici_adi: String) {
        let params:Parameters = ["kullanici_adi":"arif"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters:params).response {response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(sepet_yemeklerCevap.self, from: data)
            
                    var sepetList = [Sepetteki_Yemekler]()
                    if let gelenData = cevap.sepet_yemekler{
                        sepetList = gelenData
                        self.SepetPresenter?.presenteraVeriG√∂nder(sepetteki_yemekler: sepetList)
                    }

                }catch{
                    self.SepetPresenter?.presenteraVeriG√∂nder(sepetteki_yemekler: [])
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    func sepetiSil(sepet_yemek_id: String, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":"arif"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters:params).response {response in
            if let data = response.data{
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.sepetiGetir(kullanici_adi:"arif")
                }catch{
                    print(error.localizedDescription)
                }
            }
        
        
        
        }.resume()
    }
}
