//
//  ViewController.swift
//  GradientShadowUIKit
//
//  Created by Егор Мизюлин on 01.11.2024.
//

import UIKit

class ViewController: UIViewController {
    private let recatangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        return view
    }()

    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemRed.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 10
        return gradientLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(recatangleView)

        NSLayoutConstraint.activate([
            recatangleView.heightAnchor.constraint(equalToConstant: 100),
            recatangleView.widthAnchor.constraint(equalToConstant: 100),
            recatangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            recatangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gradientLayer.frame = recatangleView.bounds

        if gradientLayer.superlayer == nil {
            recatangleView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
