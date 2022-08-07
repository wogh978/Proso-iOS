
import Foundation

extension UIColor {
    static let primaryColor = UIColor(red: 1.00, green: 0.33, blue: 0.33, alpha: 1.00)
    static let secondaryColor = UIColor(red: 1.00, green: 0.73, blue: 0.33, alpha: 1.00)
    static let sucessColor = UIColor(red: 0.19, green: 0.51, blue: 0.96, alpha: 1.00)
    static let errorColor = UIColor(red: 0.94, green: 0.27, blue: 0.32, alpha: 1.00)
}

extension UIViewController {
    func setUpLogo() {
        let logoImage = UIImage.init(named: "logo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = 20
        navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
    }
    func changeBackButton() {
        let yourBackImage = UIImage(named: "back_button_image")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backItem?.title = ""
    }
}

extension UINavigationController {
   
    
    func addUnderLineView() {
        let height = self.view.safeAreaInsets.bottom
        
        var tabFrame = self.navigationBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        
        navigationBar.frame = tabFrame
        navigationBar.setNeedsLayout()
        navigationBar.layoutIfNeeded()
        navigationBar.frame = navigationBar.frame
        
        navigationBar.frame = navigationBar.frame
        
        navigationBar.backgroundColor = .white
      
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 20)
        navigationBar.layer.shadowOpacity = 0.5
        navigationBar.layer.shadowRadius = 10
        
        view.addSubview(navigationBar)
        view.bringSubviewToFront(navigationBar)
        
    }
}
