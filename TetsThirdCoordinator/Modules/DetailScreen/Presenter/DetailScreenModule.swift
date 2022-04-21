//
//  DetailScreenModule.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol DetailScreenModuleOutput: AnyObject {
    
    /// Закрыть второй экран
    func closeDetailScreen()
}

protocol DetailScreenModuleInput: AnyObject {
    
}

typealias DetailScreenViewController = UIViewController & DetailScreenModuleInput

final class DetailScreenModule: DetailScreenViewController {
    
    // MARK: - Internal property
    
    weak var moduleOutput: DetailScreenModuleOutput?
    
    // MARK: - Private property
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    // MARK: - Initialization
    
    init(moduleView: DetailScreenViewInput & UIView, interactor: DetailScreenInteractorInput, factory: DetailScreenFactoryInput) {
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
        
        title = Appearents().setTitle
        interactor.getContent()
    }
}

// MARK: - Private extention: DetailScreenViewOutput

extension DetailScreenModule : DetailScreenViewOutput {
    func changeColorButtonAction() {
        moduleView.changeBackgroundColors(color: .blue)
    }
    
    func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Private extention: DetailScreenFactoryOutput

extension DetailScreenModule: DetailScreenFactoryOutput {
    func didReciveFullText(text: String) {
        moduleView.setupText(text: text)
    }
}

// MARK: - Private extention: DetailScreenInteractorOutput

extension DetailScreenModule : DetailScreenInteractorOutput {
    func didRecive(text: String) {
        factory.createText(text: text)
    }
}

// MARK: - Private extention: DetailScreenModule

private extension DetailScreenModule {
    struct Appearents {
        let setTitle = "Detail screen"
    }
}
