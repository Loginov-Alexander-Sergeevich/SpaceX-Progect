import UIKit

enum Resources {
    enum Images {
        enum BackgroundImage {
            static var rocketImage: UIImage { UIImage(named: "BackgroundPic", in: .module, with: nil)! }
        }
        
        enum Button {
            static var setting: UIImage { UIImage(named: "Setting", in: .module, with: nil)! }
        }
    }
    
    enum Colors {
        static let inActive = UIColor(hexString: "#929DA5")
        enum Button {
            static let endPointBorder = UIColor(hexString: "#B83AF3")
            static let startPointBorder = UIColor(hexString: "#6950FB")
        }
    }
}
