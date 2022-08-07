//
//  TabBarViewController.swift
//  Proso-iOS
//
//  Created by changgyo seo on 2022/08/07.
//

import UIKit
import SnapKit

enum TabItem: String, CaseIterable {
    case home = "홈"
    case theme = "테마추천"
    case myPAge = "마이페이지"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return MainViewController()
        case .theme:
            return LoginViewController()
        case .myPAge:
            return UIViewController()
            
        }
    }
    // these can be your icons
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .theme:
            return UIImage(systemName: "star")!
        case .myPAge:
            return UIImage(systemName: "person")!
        }
    }
    
    var unSelectedIcon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .theme:
            return UIImage(systemName: "star.fill")!
        case .myPAge:
            return UIImage(systemName: "person")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}

class TabBarViewController: UITabBarController {
    var customTabBarView = UIView(frame: .zero)
    var tabItems: [TabItem] = [.home, .theme, .myPAge]
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarUI()
        self.addCustomTabBarView()
        attributes()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupCustomTabBarFrame()
    }
    
    private func attributes() {
        viewControllers = tabItems.map({ createNavController($0) })
        setupTabBarUI()
    }
    
    fileprivate func createNavController(_ item: TabItem) -> UIViewController {
        let navController = UINavigationController(rootViewController: item.viewController)
        navController.tabBarItem.title = item.displayTitle
        navController.tabBarItem.image = item.icon
        return navController
    }
    
    // MARK: Private methods
    
    private func setupCustomTabBarFrame() {
        let height = self.view.safeAreaInsets.bottom + 64
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        
        self.tabBar.frame = tabFrame
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
        customTabBarView.frame = tabBar.frame
    }
    
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        
        self.customTabBarView.backgroundColor = .white
        self.customTabBarView.layer.cornerRadius = 30
        self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.customTabBarView.layer.masksToBounds = false
        self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
        self.customTabBarView.layer.shadowOpacity = 0.5
        self.customTabBarView.layer.shadowRadius = 20
        
        self.view.addSubview(customTabBarView)
        self.view.bringSubviewToFront(self.tabBar)
    }
    private func setupTabBarUI() {
        // Setup your colors and corner radius
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .primaryColor
        self.tabBar.unselectedItemTintColor = .white
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
        }
    }
}
