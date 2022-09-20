//
//  kategorilerPresenter.swift
//  foodApp
//
//  Created by Arif Celebi on 16.09.2022.
//

import Foundation

class KategorilerPresenter:ViewToPresenterKategorilerProtocol{
    var KategorilerView: PresenterToViewKategorilerProtocol?

    var KategorilerInteractor: PresenterToInteractorKategorilerProtocol?
    
    func yemekleriAl(){
        KategorilerInteractor?.tumYemekleriAl()
        
    }
    
    
}

extension KategorilerPresenter:InteractorToPresenterKategorilerProtocol{
    
    func presenterVeriGönder(yemeklerListesi: Array<Yemekler>) {
        KategorilerView?.viewVeriGönder(yemekListesi: yemeklerListesi)
       
    }
}
