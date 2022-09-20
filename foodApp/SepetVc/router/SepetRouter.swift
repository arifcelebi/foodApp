//
//  SepetRouter.swift
//  foodApp
//
//  Created by Arif Celebi on 17.09.2022.
//

import Foundation

class SepetRouter:PresenterToRouterSepetProtocol{
    
    static func createModule(ref: SepetViewController) {
        
        let presenter = SepetPresenter()
        
        //view
        ref.SepetPresenterNesnesi = presenter
        
        //Presenter
        ref.SepetPresenterNesnesi?.SepetInteractor = SepetInteractor()
        ref.SepetPresenterNesnesi?.SepetView = ref
        
        //Interactor
        ref.SepetPresenterNesnesi?.SepetInteractor?.SepetPresenter = presenter
    }
}


