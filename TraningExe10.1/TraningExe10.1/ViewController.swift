    //
//  ViewController.swift
//  TraningExe10.1
//
//  Created by Nguyen Huy on 03/08/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import PagingKit
class ViewController: UIViewController {
    
    var menuViewController: PagingMenuViewController?
    var contentViewController: PagingContentViewController?
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
//    let vc1 = UIStoryboard(name: "ContentTableViewController", bundle: nil).instantiateInitialViewController() as! ContentTableViewController
//    let storyboard = UIStoryboard(name: "ContentTableViewController", bundle: nil)
//    let vc2 = storyboard.instantiateViewController(withIdentifier: "PostcastTableViewController") as! PostcastTableViewController
//    var dataSource = [(menuTitle: "Video Music", vc: ), (menuTitle: "Movie", vc: viewController(.blue)), (menuTitle: "Ebook", vc: viewController(.yellow)),(menuTitle: "Audio Book", vc: viewController(.black)),(menuTitle: "Podcast", vc: viewController(.green))]
    
    let dataSource: [(menuTitle: String, content: UIViewController)] = ["Video Music", "Movie", "Ebook", "Audio Book","Podcast"].map {
        let title = $0
        print(title)
        let storyboard = UIStoryboard(name: "ContentTableViewController", bundle: nil)
        var vc = UIViewController()
        switch (title){
        case "Video Music":
                 vc = storyboard.instantiateViewController(withIdentifier: "ContentTableViewController") as! ContentTableViewController
           //     break
        case "Podcast":
                 vc = storyboard.instantiateViewController(withIdentifier: "PostcastTableViewController") as! PostcastTableViewController
           //     break
        case "Ebook":
                 vc = storyboard.instantiateViewController(withIdentifier: "EbookViewController") as! EbookViewController
            //    break
        case "Audio Book":
                 vc = storyboard.instantiateViewController(withIdentifier: "AudioBookViewController") as! AudioBookViewController
           //     break
            
        default:
             vc = storyboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        }
//        let vc1 = UIStoryboard(name: "ContentTableViewController", bundle: nil).instantiateInitialViewController() as! ContentTableViewController
//        let vc2 =  UIStoryboard(name: "ContentTableViewController", bundle: nil).instantiateViewController(withIdentifier: "PostCastTableViewController") as! PostcastTableViewController
     
        return (menuTitle: title, content: vc)
    }
    

    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        self?.firstLoad = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController?.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        menuViewController?.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
     
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstLoad?()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController?.dataSource = self
            menuViewController?.delegate = self as? PagingMenuViewControllerDelegate // <- set menu delegate
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController?.dataSource = self as? PagingContentViewControllerDataSource
            contentViewController?.delegate = self
        }
    }
}


    
extension ViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int { // số lượng tab menu item
        return dataSource.count
    }

    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat { // độ rộng của mỗi tab
         return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menuTitle
        return cell
    }
    var insets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return .zero
        }
    }
    
  
}

extension ViewController: PagingMenuViewControllerDelegate {//
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        
        contentViewController?.scroll(to: page, animated: true)
    }
}

extension ViewController: PagingContentViewControllerDelegate {//
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController?.scroll(index: index, percent: percent, animated: false)
    }
}

extension ViewController: PagingContentViewControllerDataSource { //
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count 
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt Index: Int) -> UIViewController {
      
        return dataSource[Index].content
    }
}



