//
//  BottomSheetView.swift
//  
//
//  Created by Александр Александров on 22.03.2023.
//

import UIKit

class RocketInfoView: UIView {

    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        
        backgroundColor = .black
        layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
