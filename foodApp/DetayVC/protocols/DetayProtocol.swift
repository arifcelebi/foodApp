//
//  detayProtocols.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import Foundation

//AnaProtokoller
protocol ViewToPresenterDetayProtocol {
    var DetayInteractor:PresenterToInteractorDetayProtocol? {get set}
    var DetayView:PresenterToViewDetayProtocol? {get set}
    
    func ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)

}

protocol PresenterToInteractorDetayProtocol {
    var DetayPresenter:InteractorToPresenterDetayProtocol? {get set}
    
    func yemekEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

//TaşıyıcıProtokoller
protocol InteractorToPresenterDetayProtocol {
    func presenteraVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)
    
}

protocol PresenterToViewDetayProtocol {
    func viewVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)

}

//Router
protocol PresenterToRouterDetayProtocol {
    
    static func createModule(ref:DetayViewController)
}
