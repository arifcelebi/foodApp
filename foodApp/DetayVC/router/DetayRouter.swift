//
//  DetayRouter.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import Foundation

class detayRouter:PresenterToRouterDetayProtocol{
    static func createModule(ref: DetayViewController) {
        
        let presenter = DetayPresenter()
        
        ref.detayPresenterNesenesi = presenter
        ref.detayPresenterNesenesi?.DetayInteractor = DetayInteractor()
        ref.detayPresenterNesenesi?.DetayView = ref as? PresenterToViewDetayProtocol
        ref.detayPresenterNesenesi?.DetayInteractor?.DetayPresenter = presenter
        
 
    }
}
