//
//  DetailScreenView.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
    
    /// При нажатии меняется цвет экрана
    func changeColorButtonAction()
    
    /// Закрыть второй экран
    func closeButtonAction()
}

protocol DetailScreenViewInput: AnyObject {
    
    /// Изменение цвета экрана
    ///  - Parameters colors: цвет экрана
    func changeBackgroundColors(color: UIColor?)
    
    /// Установить текст
    /// - Parameters text : для titleLabel
    func setupText(text: String)
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    // MARK: - Internal property
    
    weak var output: DetailScreenViewOutput?
    
    // MARK: - Private property
    
    private let titleLabel = UILabel()
    private let changeColorButton = UIButton()
    private let closeButton = UIButton()
    
    // MARK: - Internal func
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public func
    
    public func changeBackgroundColors(color: UIColor?) {
        guard let color = color else { return }
        backgroundColor = color
    }
    
    public func setupText(text: String) {
        titleLabel.text = text
    }
    
    // MARK: - Private func
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        changeColorButton.setTitle(Appearents().textButton, for: .normal)
        changeColorButton.setTitleColor(.red, for: .normal)
        changeColorButton.addTarget(self, action: #selector(changeColorButtonAction), for: .touchUpInside)
        
        closeButton.setTitle(Appearents().textButtonTwo, for: .normal)
        closeButton.setTitleColor(.brown, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    @objc private func changeColorButtonAction() {
        output?.changeColorButtonAction()
    }
    
    @objc private func closeButtonAction() {
        output?.closeButtonAction()
    }
    
    private func setupConstraints() {
        [titleLabel, changeColorButton, closeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            changeColorButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            changeColorButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding),
            
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().paddingTwo)
        ])
    }
}

// MARK: - Private extention: DetailScreenView

private extension DetailScreenView {
    struct Appearents {
        let padding: CGFloat = 30
        let textButton = "При нажатии будет синий цвет"
        let paddingTwo: CGFloat = 70
        let textButtonTwo = "Вернуться на первый экран"
    }
}
