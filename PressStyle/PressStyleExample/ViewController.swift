//
//  ViewController.swift
//  PressStyle
//
//  Created by Selin Kayar on 24.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var womanImageView = createImageView(image: UIImage(named: "womanImage")!, title: "the woman")
    private lazy var dogImageView = createImageView(image: UIImage(named: "dogImage")!, title: "the dog")
    private lazy var getStartedButton = createColorButton(theme: PressStyleThemeFactory.blue, title: "GET STARTED")
    private lazy var continueButton = createColorButton(theme: PressStyleThemeFactory.green, title: "CONTINUE")
    private lazy var outlinedView = createViewButton(theme: PressStyleThemeFactory.outlined, title: "My grandparents are from France")
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dogImageView, womanImageView])
        stack.spacing = 15
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [getStartedButton, hStack, outlinedView,
                                                   continueButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.bg
        
        configureLayout()
    }
    
    private func configureLayout() {
        view.addSubview(vStack)
        
        getStartedButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    private func createColorButton(theme: PressStyleTheme, title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setPressStyle(theme) {
            button.sendActions(for: .touchUpInside)
        }
        button.setTitle(title, for: .normal)
        button.setTitleColor(theme.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy).rounded()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonTapping(_:)), for: .touchUpInside)
        return button
    }
    
    private func createImageView(image: UIImage, title: String) -> UIView {
        let view = UIView()
        view.setPressStyle(PressStyleThemeFactory.outlined) {
            print("View with the title: \(title), pressed.")
        }
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular).rounded()
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.9),

            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        return view
    }
    
    private func createViewButton(theme: PressStyleTheme, title: String) -> UIView {
        let view = UIView()
        view.setPressStyle(theme)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        let label = UILabel()
        label.text = title
        label.textColor = theme.textColor
        label.font = .systemFont(ofSize: 17, weight: .medium).rounded()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14)
        ])
        
        return view
    }
    
    @objc private func handleButtonTapping(_ button: UIButton) {
        print("\(button.titleLabel?.text ?? ""), pressed.")
    }
}
