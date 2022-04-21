//
//  DetailScreenInteractor.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol DetailScreenInteractorOutput: AnyObject {
 
    /// Был получен текст
    /// - parameters text: текст
    func didRecive(text: String)
}

protocol DetailScreenInteractorInput: AnyObject {
    
    /// Загрузка данных
    func getContent()
}

final class DetailScreenInteractor: DetailScreenInteractorInput {
    
    // MARK: - Internal property
    
    weak var output: DetailScreenInteractorOutput?
    
    func getContent() {
        output?.didRecive(text: Appearents().someText)
    }
}

// MARK: - Private extention: DetailScreenInteractor

private extension DetailScreenInteractor {
    struct Appearents {
        let someText = "экран"
    }
}
