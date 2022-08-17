//
//  UINavigationViewControllerExtenstion.swift
//  Proso-iOS
//
//  Created by changgyo seo on 2022/08/08.
//

import UIKit

extension UINavigationController {
    func setUpNavigationItems(items: [NaviagtionBarItems]) {
        var leftitems = [UIBarButtonItem]()
        var rightitems = [UIBarButtonItem]()
        //let navItem = UINavigationItem(title: "SomeTitle")
        items.forEach { item in
            switch item {
            case .logo:
                let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                negativeSpacer.width = 20
                leftitems.append(negativeSpacer)
                let buttonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                buttonItem.tintColor = .black
                leftitems.append(buttonItem)
            case .back:
                navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                navigationBar.tintColor = .black
                navigationBar.backItem?.title = ""
            case .bell:
                let buttonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                rightitems.append(buttonItem)
            case .add:
                let buttonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                rightitems.append(buttonItem)
            case .setting:
                let buttonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                rightitems.append(buttonItem)
            case .delete:
                let buttonItem = UIBarButtonItem(customView: UIImageView(image: item.image))
                rightitems.append(buttonItem)
            }
        }
        
        let height = self.view.safeAreaInsets.bottom
        
        var tabFrame = self.navigationBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        
        navigationBar.frame = tabFrame
        navigationBar.setNeedsLayout()
        navigationBar.layoutIfNeeded()
        navigationBar.frame = navigationBar.frame
        navigationBar.backgroundColor = .white
        
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 20)
        navigationBar.layer.shadowOpacity = 0.3
        navigationBar.layer.shadowRadius = 10
        navigationBar.topItem?.rightBarButtonItems = rightitems
        navigationBar.topItem?.leftBarButtonItems = leftitems
        navigationBar.tintColor = .black
        
        view.addSubview(navigationBar)
        view.bringSubviewToFront(navigationBar)
    }
}
