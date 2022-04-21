//
//  DetailScreenCoordinator.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

final class DetailScreenCoordinator: Coordinator {

    let navigatoinController: UINavigationController
    
    init(navigatoinController: UINavigationController) {
        self.navigatoinController = navigatoinController
    }
    
    func start() {
        let detailScreenModule = DetailScreenAssembly().createModule()
        detailScreenModule.moduleOutput = self
        navigatoinController.pushViewController(detailScreenModule, animated: true)
    }
}

extension DetailScreenCoordinator: DetailScreenModuleOutput {
    func closeDetailScreen() {
        navigatoinController.popViewController(animated: true)
    }
    
    
}
