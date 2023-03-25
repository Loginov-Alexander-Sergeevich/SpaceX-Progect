//
//  TestView.swift
//  
//
//  Created by Александр Александров on 22.03.2023.
//

import UIKit

class TestView: UIView {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()



    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        addSubview(verticalStackView)
        
        for _ in 1...50 {
            let button = UIButton()
            button.backgroundColor = .blue
            verticalStackView.addArrangedSubview(button)

            // Установка констрейнтов для кнопки
            button.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
        }
    }
    
    func configureConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
    }
    
}
