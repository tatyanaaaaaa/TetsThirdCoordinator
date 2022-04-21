//
//  MainScreenView.swift
//  TetsThirdCoordinator
//
//  Created by Tatiana Sosina on 21.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку
    func pushChangeColorButtonAction()
    
}

protocol MainScreenViewInput: AnyObject {
    
    /// Изменить цвет экрана на рандомный
    func changeBackgroundColors()
    
    /// Устанавливает текст
    ///  - Parameters text: для textLabel
    func setupText(text: String)
}

final class MainScreenView: UIView & MainScreenViewInput {
    
    // MARK: - Internal property
    
    weak var output: MainScreenViewOutput?
    
    // MARK: - Private property
    
    private let textLabel = UILabel()
    private let pushButton = UIButton()
    
    // MARK: - Internal func
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupDefaultSettings()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public  func changeBackgroundColors() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    // MARK: - Public func
    
    public func setupText(text: String) {
        textLabel.text = text
    }
    
    // MARK: - Private func
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        pushButton.setTitle(Appearents().textName, for: .normal)
        pushButton.setTitleColor(.red, for: .normal)
        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    }
    
    @objc private func pushButtonAction() {
        output?.pushChangeColorButtonAction()
    }
    
    private func setupConstraints() {
        [textLabel, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pushButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding)
        ])
    }
}

// MARK: - Private extention: MainScreenView

private extension MainScreenView {
    struct Appearents {
        let textName = "Нажми на меня и измени цвет экрана"
        let padding: CGFloat = 30
    }
}
