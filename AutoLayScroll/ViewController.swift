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
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .CenterX,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Width,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Top,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: scrollView,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: 0.0)])

        scrollView.addConstraints([
            NSLayoutConstraint(item: contentView,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: scrollView,
                attribute: .CenterX,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: scrollView,
                attribute: .Width,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: scrollView,
                attribute: .Top,
                multiplier: 1.0,
                constant: 0.0),
            NSLayoutConstraint(item: contentView,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: scrollView,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: 0.0)])

        var previousViewElement:UIView!
 
        let colorsArray = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(),
                           UIColor.cyanColor(), UIColor.magentaColor(), UIColor.yellowColor()]

        for _ in 1...numberOfSubViews {
            let view = UIView()
            view.backgroundColor = colorsArray[Int(arc4random_uniform(UInt32(colorsArray.count)))] as UIColor
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
            
            contentView.addConstraints([
                NSLayoutConstraint(item: view,
                    attribute: .CenterX,
                    relatedBy: .Equal,
                    toItem: contentView,
                    attribute: .CenterX,
                    multiplier: 1.0,
                    constant: 0.0),
                NSLayoutConstraint(item: view,
                    attribute: .Width,
                    relatedBy: .Equal,
                    toItem: contentView,
                    attribute: .Width,
                    multiplier: 6/7,
                    constant: 0.0),
                NSLayoutConstraint(item: view,
                    attribute: .Height,
                    relatedBy: .Equal,
                    toItem: contentView,
                    attribute: .Height,
                    multiplier: 0.0,
                    constant: 50.0 * CGFloat(1 + arc4random_uniform(7)))])
            
            if previousViewElement == nil {
                contentView.addConstraint(
                    NSLayoutConstraint(item: view,
                        attribute: .Top,
                        relatedBy: .Equal,
                        toItem: contentView,
                        attribute: .Top,
                        multiplier: 1.0,
                        constant: 20.0))
            } else {
                contentView.addConstraint(
                    NSLayoutConstraint(item: view,
                        attribute: .Top,
                        relatedBy: .Equal,
                        toItem: previousViewElement,
                        attribute: .Bottom,
                        multiplier: 1.0,
                        constant: 20.0))
            }
            
            previousViewElement = view
        }

        // At this point previousViewElement refers to the last subview, that is the one at the bottom.
        contentView.addConstraint(
            NSLayoutConstraint(item: previousViewElement,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: .Bottom,
                multiplier: 1.0,
                constant: -20.0))
    }
}

