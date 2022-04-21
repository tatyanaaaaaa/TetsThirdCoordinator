//
//  DetailScreenFactory.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol DetailScreenFactoryOutput: AnyObject {
 
    /// Исправлен полученный текст на новый
    /// - Parameters text ; готов к отображению
    func didReciveFullText(text:String)
}

protocol DetailScreenFactoryInput: AnyObject {
    
    /// Был получен текст для изменения
    ///  - Parameters text : испарвить text
    func createText(text: String)
}

final class DetailScreenFactory: DetailScreenFactoryInput {
    
    // MARK: - Internal property
    
    weak var output: DetailScreenFactoryOutput?
    
    func createText(text: String) {
        let appearents = "\(Appearents().someText) \(text)"
        output?.didReciveFullText(text: appearents)
    }
}

// MARK: - Private extention: DetailScreenFactory

private extension DetailScreenFactory {
    struct Appearents {
        let someText = "Закрыть"
    }
}
