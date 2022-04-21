//
//  MainScreenInteractor.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Были получены данные
    /// - Parameters text: текст
    func didRecive(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Загрузить данные
    func getContent()
}

final class MainScreenInteractor: MainScreenInteractorInput {

    // MARK: - Internal property
    
    weak var output: MainScreenInteractorOutput?
    
    func getContent() {
        output?.didRecive(text: Appearents().someText)
    }
}

// MARK: - Private extention: MainScreenInteractor

private extension MainScreenInteractor {
    struct Appearents {
        let someText = "здесь."
    }
}
