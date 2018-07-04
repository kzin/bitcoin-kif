//
//  NSLayoutConstraint+Util.swift
//  Pods
//
//  Created by Bruno Mazzo on 05/09/17.
//
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    public static func inset(view: UIView,
                             inSuperview superView: UIView,
                             withInset inset: UIEdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [.top(firstItem: superView, secondItem: view, constant: -Float(inset?.top ?? 0) ),
                .left(firstItem: superView, secondItem: view, constant: -Float(inset?.left ?? 0)),
                .right(firstItem: superView, secondItem: view, constant: Float(inset?.right ?? 0)),
                .bottom(firstItem: superView, secondItem: view, constant: Float(inset?.bottom ?? 0))]
        
    }
    
    public static func safeAreaTop(safeAreaItem: UIView, otherItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            if #available(iOS 11.0, *) {
                return safeAreaItem.safeAreaLayoutGuide.topAnchor.constraint(equalTo: otherItem.topAnchor, constant: CGFloat(constant))
            } else {
                return top(firstItem: safeAreaItem, secondItem: otherItem, constant:constant)
            }
    }
    
    public static func safeAreaBottom(safeAreaItem: UIView, otherItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            if #available(iOS 11.0, *) {
                return safeAreaItem.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: otherItem.bottomAnchor, constant: CGFloat(constant))
            } else {
                return bottom(firstItem: safeAreaItem, secondItem: otherItem, constant:constant)
            }
    }
    
    public static func top(firstItem: UIView, secondItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutAttribute.top,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondItem,
                                      attribute: NSLayoutAttribute.top,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
    public static func left(firstItem: UIView, secondItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutAttribute.left,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondItem,
                                      attribute: NSLayoutAttribute.left,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
    public static func right(firstItem: UIView, secondItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutAttribute.right,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondItem,
                                      attribute: NSLayoutAttribute.right,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
    public static func bottom(firstItem: UIView, secondItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstItem,
                                      attribute: NSLayoutAttribute.bottom,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondItem,
                                      attribute: NSLayoutAttribute.bottom,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
    
    public static func over(topItem: UIView, bottomItem: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: topItem,
                                      attribute: NSLayoutAttribute.bottom,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: bottomItem,
                                      attribute: NSLayoutAttribute.top,
                                      multiplier: 1,
                                      constant: -1 * CGFloat(constant))
    }
    
    public static func aside(left: UIView, right: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            
            return NSLayoutConstraint(item: left,
                                      attribute: NSLayoutAttribute.right,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: right,
                                      attribute: NSLayoutAttribute.left,
                                      multiplier: 1,
                                      constant: -1 * CGFloat(constant))
    }
    
    public static func height(view: UIView, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.height,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    public static func width(view: UIView, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.width,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: nil,
                                  attribute: NSLayoutAttribute.notAnAttribute,
                                  multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    public static func aspectRadio(view: UIView, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view,
                                  attribute: NSLayoutAttribute.width,
                                  relatedBy: NSLayoutRelation.equal,
                                  toItem: view,
                                  attribute: NSLayoutAttribute.height,
                                  multiplier: CGFloat(constant),
                                  constant: 0)
    }
    
    public static func verticalCenter(firstView: UIView, secondView: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutAttribute.centerY,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutAttribute.centerY,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
    
    public static func horizontalCenter(firstView: UIView, secondView: UIView, constant: Float = 0)
        -> NSLayoutConstraint {
            return NSLayoutConstraint(item: firstView,
                                      attribute: NSLayoutAttribute.centerX,
                                      relatedBy: NSLayoutRelation.equal,
                                      toItem: secondView,
                                      attribute: NSLayoutAttribute.centerX,
                                      multiplier: 1,
                                      constant: CGFloat(constant))
    }
}

extension Array where Element == NSLayoutConstraint {
    
    public func active() {
        NSLayoutConstraint.activate(self)
    }
    
    public func deactive() {
        NSLayoutConstraint.deactivate(self)
    }
}

