//
//  TabBarVCs.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/21/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class TabBarVCs : UITabBarController{
    
//     , UITabBarControllerDelegate
    
    
//    private var circleView : UIView!
//    private var circleImageView: UIImageView!
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tabBar = MStabBar()
//        self.setValue(tabBar, forKey: "tabBar")
//        self.circleView = UIView(frame: .zero)
//        circleView.layer.cornerRadius = 30
//        circleView.backgroundColor = .white
//        circleView.isUserInteractionEnabled = false
//        self.circleImageView = UIImageView(frame: .zero)
//        circleImageView.layer.cornerRadius = 30
//        circleImageView.isUserInteractionEnabled = false
////        if selectedIndex == 0 {
////            circleImageView.contentMode = self.tabBar.tag[4]
////        }else if selectedIndex == 1 {
////            circleImageView.contentMode = self.tabBar.frame.width/3
////        }else if selectedIndex == 2 {
////            circleImageView.contentMode = self.tabBar.frame.width/2
////        }else {
////            circleImageView.contentMode = self.tabBar.frame.width
////        }
//        circleImageView.contentMode = .center
//        circleView.addSubview(circleImageView)
//        self.view.addSubview(circleView)
//        self.tabBar.tintColor = #colorLiteral(red: 0.9535121322, green: 0.6093340516, blue: 0.606231451, alpha: 1)
//        self.tabBar.barTintColor = .white
//        self.tabBar.backgroundColor = .white
//        self.delegate = self
    }
//
//
//    open override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        circleView.frame = CGRect(x: self.view.bounds.width / 2 - 30, y: self.tabBar.frame.origin.y - 20 , width: 60, height: 60)
//
//        circleImageView.frame = self.circleView.bounds
//
//        if selectedIndex == 0 {
//            circleImageView.image = image(with: self.tabBar.items?[0].image, scaledTo: CGSize(width: 30, height: 30))
//        }else if selectedIndex == 1{
//            circleImageView.image = image(with: self.tabBar.items?[1].image, scaledTo: CGSize(width: 30, height: 30))
//        }else if selectedIndex == 2{
//        circleImageView.image = image(with: self.tabBar.items?[2].image, scaledTo: CGSize(width: 30, height: 30))
//        }else {
//            circleImageView.image = image(with: self.tabBar.items?[3].image, scaledTo: CGSize(width: 30, height: 30))
//        }
//
//
//
//
//    }
//
//    open override func viewSafeAreaInsetsDidChange() {
//        if #available(iOS 11.0, *) {
//            super.viewSafeAreaInsetsDidChange()
//        }
//        updateTabBarFrame()
//    }
//
//
//    private func updateTabBarFrame() {
//        var tabFrame = self.tabBar.frame
//        tabFrame.size.height = 60
//        tabFrame.origin.y = self.view.frame.size.height - 60
//        self.tabBar.frame = tabFrame
//        tabBar.setNeedsLayout()
//    }
//
//
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
//        if selectedIndex == 0 {
//                 circleImageView.image = image(with: UIImage(named: "Search"), scaledTo: CGSize(width: 30, height: 30))
//        }else if selectedIndex == 1{
//            circleImageView.image = image(with: UIImage(named: "Favorites"), scaledTo: CGSize(width: 30, height: 30))
//        }else if selectedIndex == 2{
//            circleImageView.image = image(with: UIImage(named: "Appointment"), scaledTo: CGSize(width: 30, height: 30))
//        }else {
//            circleImageView.image = image(with: UIImage(named: "More"), scaledTo: CGSize(width: 30, height: 30))
//        }
//    }
//
//
//
//
//    private func image(with image: UIImage?, scaledTo newSize: CGSize) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(newSize, _: false, _: 0.0)
//        image?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
//        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage
//    }
//
//
    
}
