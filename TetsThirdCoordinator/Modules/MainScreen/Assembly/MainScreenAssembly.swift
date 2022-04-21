//
//  MainScreenAssembly.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

final class MainScreenAssembly {
    func createModule() -> MainScreenModule {
        let view = MainScreenView()
        let interactor = MainScreenInteractor()
        let factory = MainScreenFactory()
        let presenter = MainScreenModule(moduleView: view, interactor: interactor, factory: factory)
        
        interactor.output = presenter
        view.output = presenter
        factory.output = presenter
        return presenter
    }
}
