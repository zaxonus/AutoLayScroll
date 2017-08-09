//
//  ViewController.swift
//  AutoLayScroll
//
//  Created by Michel Bouchet on 19/08/2016.
//  Copyright © 2016 Michel Bouchet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView(), contentView = UIView(), numberOfSubViews = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        self.view.addConstraints([
            NSLayoutConstraint(item: scrollView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .width,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .width,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .top,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .top,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 0.0)])

        scrollView.addConstraints([
            NSLayoutConstraint(item: contentView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: scrollView,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .width,
                relatedBy: .equal,
                toItem: scrollView,
                attribute: .width,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .top,
                relatedBy: .equal,
                toItem: scrollView,
                attribute: .top,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: scrollView,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 0.0)])

        var previousViewElement:UIView!
 
        let colorsArray = [UIColor.red, UIColor.green, UIColor.blue,
                           UIColor.cyan, UIColor.magenta, UIColor.yellow]

        for _ in 1...numberOfSubViews {
            let view = UIView()
            view.backgroundColor = colorsArray[Int(arc4random_uniform(UInt32(colorsArray.count)))] as UIColor
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
            
            contentView.addConstraints([
                NSLayoutConstraint(item: view,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: contentView,
                    attribute: .centerX,
                    multiplier: 1.0,
                    constant: 0.0),
                NSLayoutConstraint(item: view,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: contentView,
                    attribute: .width,
                    multiplier: 6/7,
                    constant: 0.0),
                NSLayoutConstraint(item: view,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0.0,
                    constant: 50.0 * CGFloat(1 + arc4random_uniform(7)))])
            
            if previousViewElement == nil {
                contentView.addConstraint(
                    NSLayoutConstraint(item: view,
                        attribute: .top,
                        relatedBy: .equal,
                        toItem: contentView,
                        attribute: .top,
                        multiplier: 1.0,
                        constant: 20.0))
            } else {
                contentView.addConstraint(
                    NSLayoutConstraint(item: view,
                        attribute: .top,
                        relatedBy: .equal,
                        toItem: previousViewElement,
                        attribute: .bottom,
                        multiplier: 1.0,
                        constant: 20.0))
            }
            
            previousViewElement = view
        }

        // At this point previousViewElement refers to the last subview, that is the one at the bottom.
        contentView.addConstraint(
            NSLayoutConstraint(item: previousViewElement,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .bottom,
                multiplier: 1.0,
                constant: -20.0))
    }
}

