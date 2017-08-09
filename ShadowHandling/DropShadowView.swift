//
//  DropShadowView.swift
//  ShadowHandling
//
//  Created by Varun Dudeja on 08/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import UIKit

protocol ShadowVisibilityHandler {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

class DropShadowView: UIView {
    
    private var hasShadow: Bool = false
    
    @IBInspectable
    var isTopView: Bool = false {
        didSet {
            if !isTopView {
                addShadow(bool: true)
            }
        }
    }
    
    fileprivate func addShadow(bool: Bool) {
        
        if bool && !hasShadow {
            
            let shadowPath = UIBezierPath(rect: bounds)
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: (isTopView ? 3.0 : -3.0))
            layer.shadowRadius = 1.5
            layer.shadowOpacity = 0.5
            layer.shadowPath = shadowPath.cgPath
            hasShadow = true
            
        } else if !bool && hasShadow {
            layer.shadowOpacity = 0.0
            hasShadow = false
        }
    }
    
}

extension DropShadowView: ShadowVisibilityHandler {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isTopView {
            if scrollView.contentOffset.y > 0 {
                addShadow(bool: true)
            } else {
                addShadow(bool: false)
            }
        } else {
            if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height && scrollView.contentSize.height > scrollView.frame.height {
                addShadow(bool: false)
            } else {
                addShadow(bool: true)
            }
        }
    }
}
