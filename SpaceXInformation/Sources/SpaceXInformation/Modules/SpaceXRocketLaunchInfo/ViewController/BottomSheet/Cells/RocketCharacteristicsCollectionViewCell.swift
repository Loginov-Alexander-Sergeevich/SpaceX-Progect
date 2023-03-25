import UIKit

class RocketCharacteristicsCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 32
        backgroundColor = UIColor(hexString: "#212121")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
