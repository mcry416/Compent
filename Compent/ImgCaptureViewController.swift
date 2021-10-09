//
//  ImgCaptureViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/28.
//

import UIKit
import Alamofire
import SwiftSoup

class ImgCaptureViewController: BaseViewController {
    
    var fetchArray: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        asyncHandlerService()

        // Do any additional setup after loading the view.
        /*
        initData(finish: { temp in
            let tempArray: Array<String> = temp as! Array<String>
            for j in tempArray{
                print("------> OUTSIDE PARA:\(j)")
            }
        })
 */
        
    }
    
    private func autoInferenceURL(_ initURL: String){
        
        /*
         * @auth mcry416@outllok.com
         * @date 21/09/30
         * We assume the parameter 'initURL' contains suffix string '.html',
         * consequently we could remove its suffix of '.html' and according
         * to 'WEBSITE IMAGES PAGES RULES' to append a number suffix such as
         * 1 and append suffix string '.html' lastly, which is a cycle for do
         * this step by step until the network request's response status is
         * 400(and so on), this method is stopping to inference.
         *
         */
        if initURL.contains(".html") {
            var autoInferURL = initURL.replacingOccurrences(of: ".html", with: "")
            autoInferURL.append("_1")
            autoInferURL.append(".html")
            fetchArray.append(autoInferURL)
        }
        
    }
    
    private func asyncHandlerService(){
        //Async to append block.
        DispatchQueue.global(qos: .default).async {
            // Deal with time-consuming tasks here.
            var i: Int = 1
            let rawURL = "https://www.jpxgmn.top/Xiuren/Xiuren19521.html"
            var nextURL = rawURL
            
            while self.getRequestStatus(nextURL) {
                nextURL = self.generateNextURL("https://www.jpxgmn.top/Xiuren/Xiuren19521.html", i)
                print("-------. TEMP URL :\(nextURL)")
                i = i + 1
            }
                    
            // When time-consuming tasks finished, process this task in the main thread.
            DispatchQueue.main.async {

            }
        }
    }
    
    private func getRequestStatus(_ url: String) -> Bool{
        var couldDoNextRequest = true
        AlamofireLayer.requestCouldContinue(MethodType.get, URLString: url) { (response) in
            if response as! String == "true" {
                NSLog("------> METHOD NORMAL EXE.")
                couldDoNextRequest = true
            } else if response as! String == "false" {
                NSLog("------> METHOD ERROR EXE.")
                couldDoNextRequest = false
            }
        }
        NSLog("------> RETURN EXE.")
        return couldDoNextRequest
    }
    
    private func generateNextURL(_ rawURL: String, _ signalIndex: Int) -> String{
        if rawURL.hasSuffix(".html") {
            var nextInferURL = rawURL.replacingOccurrences(of: ".html", with: "")
            nextInferURL.append("_\(signalIndex)")
            nextInferURL.append(".html")
            return nextInferURL
        } else {
            return ""
        }
    }
    
    private func initData(finish: @escaping (Any) -> ()){
        /*
        AlamofireLayer.requestData(MethodType.get, URLString: "https://www.jpxgmn.top/Xiuren/Xiuren19508.html", parameters: nil) { result in
            print("------> RAW DATA:\(result)")
            
            
            let data = result as! Data
            let tempString = String(data: data, encoding: String.Encoding.utf8)
            
            do {
                let doc: Document = try SwiftSoup.parse(tempString!)
                let srcs: Elements = try doc.select("img[src]")
                let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
                // do something with srcsStringArray
                for i in srcsStringArray{
                    print("------> IMG:\(i ?? "nil_pic.png")")
                    self.fetchArray.append(i ?? "nil_pic.png")
                    finish(self.fetchArray)
                }
            } catch Exception.Error(_, let message) {
                print(message)
            } catch {
                print("error")
            }
        }
        
        */
        
        AlamofireLayer.requestData(MethodType.get, URLString: "https://www.jpxgmn.top/Xiuren/Xiuren19508.html", parameters: nil) { result in
            print("------> RAW DATA:\(result)")
            
            var initURL = "https://www.jpxgmn.top/Xiuren/Xiuren19508.html"
            var autoInferURL = initURL.replacingOccurrences(of: ".html", with: "")
            autoInferURL.append("_1")
            autoInferURL.append(".html")

        }
    }

}
