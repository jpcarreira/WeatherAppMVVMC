import UIKit


extension UIColor {
    
    /**
     https://stackoverflow.com/questions/29779128/how-to-make-a-random-color-with-swift
     */
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
