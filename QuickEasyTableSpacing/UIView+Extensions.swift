//
//  UIView+Extensions.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import Foundation
import UIKit

extension UIView {
    func setProfileImage() {
        let randomSet = Int.random(in: 1...42)
        
        setProfileImage("profile", randomSet)
    }
    
    private func setProfileImage(_ imageName: String, _ version: Int) {
        self.backgroundColor = .clear
        
        let bgProfileImage = "\(imageName)-\(version)"
        let bgImage = UIImage(named: bgProfileImage)
        let bgImageView = UIImageView(frame: self.bounds)
        bgImageView.image = bgImage
        
        self.insertSubview(bgImageView, at: 0)
    }
    
    func setBackgroundImage() {
        let randomSet = Int.random(in: 0...2)
        let randomBgNumber = Int.random(in: 1...4)
        
        switch(randomSet) {
        case 0:
            setBgImage("primary", randomBgNumber)
            break
        case 1:
            setBgImage("secondary", randomBgNumber)
            break
        case 2:
            setBgImage("tertiary", randomBgNumber)
            break
        default:
            setBgImage("primary", randomBgNumber)
            break
        }
    }
    
    private func setBgImage(_ imageName: String, _ version: Int) {
        let bgImageName = "\(imageName)-wave-\(version)"
        let bgImage = UIImage(named: bgImageName)
        let bgImageView = UIImageView(frame: self.bounds)
        bgImageView.image = bgImage
        bgImageView.contentMode = .scaleToFill
        
        self.insertSubview(bgImageView, at: 0)
    }
    
    public func addDropShadow() {
        self.layer.shadowOffset = CGSize(width: 2.00, height: 2.00)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.00
        self.layer.shadowOpacity = 0.35
        self.layer.masksToBounds = true
    }
    
    public func addBorder() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    public func roundCorners() {
        self.layer.cornerRadius = 8.00
        self.clipsToBounds = true
    }
}
