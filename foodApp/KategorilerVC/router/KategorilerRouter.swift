//
//  kategorilerRouter.swift
//  foodApp
//
//  Created by Arif Celebi on 16.09.2022.
//

import Foundation

class KategorilerRouter: PresenterToRouterKategorileProtocol {
    
    static func createModule(ref: KategorilerVC) {
        let presenter = KategorilerPresenter()
        
        //view
        ref.KategorilerPresenterNesnesi = presenter
        
        //presenter
        ref.KategorilerPresenterNesnesi?.KategorilerInteractor = KategorilerInteractor()
        ref.KategorilerPresenterNesnesi?.KategorilerView = ref
        
        
        //interactor
        ref.KategorilerPresenterNesnesi?.KategorilerInteractor?.KategorilerPresenter = presenter
    }
}
