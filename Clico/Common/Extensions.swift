//
//  Extentions.swift
//  Clico
//
//  Created by Mohamed on 05/10/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithColor(_ color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0);
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

class ParentViewController: UIViewController {
}

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in self.tabBar.items! {
            item.image = item.selectedImage?.imageWithColor(UIColor.white).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            let attributes = [NSForegroundColorAttributeName: UIColor.white]
            item.setTitleTextAttributes(attributes, for: UIControlState())
        }
    }
}
