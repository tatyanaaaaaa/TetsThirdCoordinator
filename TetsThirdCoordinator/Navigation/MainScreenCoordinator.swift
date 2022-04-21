//
//  MainScreenCoordinator.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

final class MainScreenCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    var detailScreenCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let mainScreenModule = MainScreenAssembly().createModule()
        mainScreenModule.moduleOutput = self
        navigationController.pushViewController(mainScreenModule, animated: true)
    }
    
    private func showDetailScreen() {
        let detailScreenCoordinator: Coordinator = DetailScreenCoordinator(navigatoinController: navigationController)
        self.detailScreenCoordinator = detailScreenCoordinator
        detailScreenCoordinator.start()
    }
    
}

extension MainScreenCoordinator: MainScreenModuleOutput {
    func showNewScreenButtonActoin() {
        showDetailScreen()
    }
}
