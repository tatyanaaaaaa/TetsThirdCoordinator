//
//  MainScreenModule.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol MainScreenModuleOutput: AnyObject {
    
    /// func  on coordinator
    func showNewScreenButtonActoin()
}

protocol MainScreenModuleInput: AnyObject {
    
}

typealias MainScreenModuleViewController = UIViewController & MainScreenModuleInput

final class MainScreenModule: MainScreenModuleViewController {
    
    // MARK: - Internal property
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    // MARK: - Private property
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    // MARK: - Initialization
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput,
         factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getContent()
        title = Appearents().titleLabel
    }
}

// MARK: - Private extention: MainScreenViewOutput

extension MainScreenModule: MainScreenViewOutput {
    func pushChangeColorButtonAction() {
        moduleView.changeBackgroundColors()
        moduleOutput?.showNewScreenButtonActoin()
    }
}

// MARK: - Private extention: MainScreenFactoryOutput

extension MainScreenModule: MainScreenFactoryOutput {
    func didReciveFullText(text: String) {
        moduleView.setupText(text: text)
    }
}

// MARK: - Private extention: MainScreenInteractorOutput

extension MainScreenModule: MainScreenInteractorOutput {
    func didRecive(text: String) {
        factory.didGetText(text: text)
    }
}

// MARK: - Private extention: MainScreenModule

private extension MainScreenModule {
    struct Appearents {
        let titleLabel = "Main screen"
    }
}
