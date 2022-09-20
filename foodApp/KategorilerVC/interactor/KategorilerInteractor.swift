//
//  kategorilerInteractor.swift
//  foodApp
//
//  Created by Arif Celebi on 16.09.2022.
//

import Foundation
import Alamofire
import Kingfisher

class KategorilerInteractor:PresenterToInteractorKategorilerProtocol{

    var KategorilerPresenter: InteractorToPresenterKategorilerProtocol?
    
    func tumYemekleriAl() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(yemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        self.KategorilerPresenter?.presenterVeriGönder(yemeklerListesi: liste)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        } .resume()
        
    }

    
}
