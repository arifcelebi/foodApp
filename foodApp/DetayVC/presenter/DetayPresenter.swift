//
//  detayPresenter.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import Foundation

class DetayPresenter:ViewToPresenterDetayProtocol {
    
    var DetayInteractor: PresenterToInteractorDetayProtocol?
    var DetayView: PresenterToViewDetayProtocol?
    
func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
    DetayInteractor?.yemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
        
    }
}
extension DetayPresenter:InteractorToPresenterDetayProtocol {
    func presenteraVeriGönder(sepetteki_yemekler: Array<Sepetteki_Yemekler>) {
        
        DetayView?.viewVeriGönder(sepetteki_yemekler: sepetteki_yemekler)
    }
}
