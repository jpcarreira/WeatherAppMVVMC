import UIKit


extension CGFloat {
    
    /**
     https://stackoverflow.com/questions/29779128/how-to-make-a-random-color-with-swift
     */
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
