//
//  ViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit
import SideMenu
import UserNotifications
import NotificationBannerSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var dataArray: Array<String> = ["Simple Useage Default","Simple Usage Wanning","Bottom Show","Plain Show","Side View", "Danger Side View", "on Tap", "on Swip Up", "Heavy Touch", "Select a picture", "KVO", "Notification", "Design Pattern", "Pop", "GCD", "Slide", "KEYBOARD", "Paint", "Animation"]
    var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        switch indexPath.row {
        case 0:
            self.present(SideMenuManager.default.leftMenuNavigationController!, animated: true,
                         completion: nil)
            let banner = NotificationBanner(title: "Test Title", subtitle: "This is a test subtitle.", style: BannerStyle.info)
            banner.show()
            
        case 1:
            /*
            let banner = NotificationBanner(title: "Test Title", subtitle: "This is a test subtitle.", style: BannerStyle.warning)
            banner.show()
 */
            let vc = Business1ViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 2:
            let banner = NotificationBanner(attributedTitle: NSAttributedString(string: "Test title"))
            banner.show(bannerPosition: .bottom)
        case 3:
            let banner = NotificationBanner(attributedTitle: NSAttributedString(string: "Test title"))
            let vc = ViewController()
            banner.show(on: vc)
        case 4:
            let rightView = UIImageView(image: UIImage(named: "ef"))
            let banner = NotificationBanner(title: "Side View", subtitle: "This is a side view with an image", rightView: rightView, style: BannerStyle.success)
            banner.show()
        case 5:
            let rightView = UIImageView(image: UIImage(named: "ef"))
            let banner = NotificationBanner(title: "Side View", subtitle: "This is a side view with an image", rightView: rightView, style: BannerStyle.danger)
            banner.show()
        case 6:
            let banner = NotificationBanner(title: "Test Title", subtitle: "This is a test subtitle.", style: BannerStyle.info)
            banner.show()

        case 7:
            let banner = NotificationBanner(title: "Test Title", subtitle: "This is a test subtitle.", style: BannerStyle.info)
            banner.show()

        case 8:
            let banner = NotificationBanner(title: "Test Title", subtitle: "This is a test subtitle.", style: BannerStyle.info)
            banner.show()
            banner.haptic = .heavy
        case 9:
            let vc = ImageViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("------>")
        case 10:
            let vc = KVOViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 11:
            let vc = NotifViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 12:
            let vc = DesignPatternViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 13:
            let vc = PopBaseViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 14:
            let vc = GCDViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 15:
            let vc = SlideViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 16:
            let vc = KeyBoardViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 17:
            let vc = PaintViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 18:
            let vc = AnimationViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
    
    private func initView(){
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "CELL_ID")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    private func initConfig(){
        let menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = menu
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        
        initConfig()
        
    //    sendNotice()
    }
    
    private func sendNotice() {
        let content = UNMutableNotificationContent()
        content.title = "Apple Music"
        content.subtitle = "<<Lover>>"
        content.body = "Taylor Swift all new album to explore."
        content.sound = .defaultCritical
       
        
        if let imageURL = Bundle.main.url(forResource: "taylor", withExtension: "jpeg"),
            let attachment = try? UNNotificationAttachment(identifier: "imageAttachment",
                                                           url: imageURL, options: nil) {
            content.attachments = [attachment]
        }
 
        
        
        /*
        let testPath = Bundle.main.path(forResource: "taylor", ofType: "jpeg")
        print("------> url:\(testPath)")
        
        if let path = Bundle.main.path(forResource: "taylor", ofType: "jpeg") {
            let url = URL(fileURLWithPath: path)
            

            print("------> 1.")
            
            do {
                let attachment = try UNNotificationAttachment(identifier: "DontForget", url: url, options: nil)
                content.attachments = [attachment]
                
                print("------> 2.")
            } catch {
                print("The attachment was not loaded.")
            }
        }
 */
         
        //设置通知触发器
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
         
        //设置请求标识符
        let requestIdentifier = "com.hangge.testNotification"
         
        //设置一个通知请求
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
         
        //将通知请求添加到发送中心
        UNUserNotificationCenter.current().add(request) { error in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }
    }


}

