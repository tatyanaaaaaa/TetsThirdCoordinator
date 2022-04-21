//
//  MainScreenFactory.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
    /// Текст исправлен
    /// - Parameters text: готово с отображению
    func didReciveFullText(text: String)
}

protocol MainScreenFactoryInput: AnyObject {
    
    /// Был получен текст для исправления
    /// - Parameters text: исходный вид
    func didGetText(text: String)
}

final class MainScreenFactory: MainScreenFactoryInput {

    weak var output: MainScreenFactoryOutput?
    
    func didGetText(text: String) {
        let appearents = "\(Appearents().someText) \(text)"
        output?.didReciveFullText(text: appearents)
    }
}

private extension MainScreenFactory {
    struct Appearents {
        let someText = "Текст - "
    }
}
