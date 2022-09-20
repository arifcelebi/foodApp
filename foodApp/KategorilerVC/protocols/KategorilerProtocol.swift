//
//  kategorilerProtocol.swift
//  foodApp
//
//  Created by Arif Celebi on 16.09.2022.
//

import Foundation

//Ana Protokol

protocol ViewToPresenterKategorilerProtocol{
    
    var KategorilerInteractor:PresenterToInteractorKategorilerProtocol? {get set}
    var KategorilerView:PresenterToViewKategorilerProtocol?{get set}
    
    func yemekleriAl()
        
}

protocol PresenterToInteractorKategorilerProtocol{
    
    var KategorilerPresenter:InteractorToPresenterKategorilerProtocol? {get set}
    func tumYemekleriAl()
    
    
}


//Taşıyıcı protokoller

protocol InteractorToPresenterKategorilerProtocol{
    func presenterVeriGönder(yemeklerListesi:Array<Yemekler>)
    
    
}

protocol PresenterToViewKategorilerProtocol{
    func viewVeriGönder(yemekListesi:Array<Yemekler>)
    
}
//router
protocol PresenterToRouterKategorileProtocol{
    
    static func createModule(ref:KategorilerVC)
    
}

