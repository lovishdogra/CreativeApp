//
//  WebConnection.swift
//  VideoChat
//
//  Created by Rohit Singh on 08/12/15.
//  Copyright © 2015 Home. All rights reserved.
//

import UIKit
import AFNetworking
import Reachability


class WebConnection: NSObject {
    
    
    // Singleton Object Creation
    static let sharedInstance : WebConnection = {
        let instance = WebConnection()
        return instance
    }()
    
    
    // Checking the internet Internet Connection
    func isInternetConnected() -> Bool {
        let reach : Reachability =  Reachability.forInternetConnection()
        let netStatus : NetworkStatus = reach.currentReachabilityStatus()
        
        if (netStatus == NetworkStatus.NotReachable)
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    
    // Making String Request Api Call 
    func callStringWebServiceWithUrl(_ urlString:String?,
                                     time : TimeInterval,
                                     isPost:Bool,
                                     headers:Dictionary<String,AnyObject>?,
                                     params:Dictionary<String, AnyObject>?,
                                     completionHandler:@escaping (NSDictionary?) -> Void)
    {
        print(kAPIHost)
        print(params)
        
        let request : URLRequest = AFHTTPRequestSerializer().request(withMethod: "POST", urlString: kAPIHost, parameters: params, error: nil) as URLRequest
        
        let session = URLSession.shared
        
        if (WebConnection.sharedInstance.isInternetConnected())
        {
            session.dataTask(with: request, completionHandler: { (data: Data?, response : URLResponse?, err : NSError?) -> Void in
                
                if data != nil {
                    
                    //let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    //print("Body: \(strData)")
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        {
                            //let success = json["success"] as? Int
                            // Okay, the `json` is here, let's get the value for 'success' out of it
                            //print("Success: \(success)")
                            //print("jsonResponse is \(json)")
                            completionHandler(json)
                        }
                        else
                        {
                            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                            // No error thrown, but not NSDictionary
                            print("Error could not parse JSON: \(jsonStr)")
                            completionHandler(nil)
                        }
                    }
                    catch let parseError {
                        print(parseError)
                        // Log the error thrown by `JSONObjectWithData`
                        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        print("Error could not parse JSON: '\(jsonStr)'")
                        completionHandler(nil)
                    }
                } else {
                    completionHandler(nil)
                }
                
                } as! (Data?, URLResponse?, Error?) -> Void).resume();
        }
        
        
        
    }
    
    
    
    
    
    func callWebServiceWithUrl(_ urlString:String,
                               time : TimeInterval,
                               isPost:Bool,
                               headers:Dictionary<String,AnyObject>?,
                               params:Dictionary<String, AnyObject>?,
                               completionHandler:@escaping (NSDictionary?) -> Void)
    {
        let session = URLSession.shared
        
        let finalString = String(format: "%@%@", arguments: [kAPIHost,urlString])
        
        print("finalString\(finalString)")
        let url:URL = URL(string: finalString)!
        
        var request:URLRequest = URLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: time)
        
        if isPost == true
        {
            request.httpMethod = "POST"
        }
        else
        {
            request.httpMethod = "GET"
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let unwarp = params{
            request.httpBody = try! JSONSerialization.data(withJSONObject: unwarp, options: .prettyPrinted)
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: unwarp, options: JSONSerialization.WritingOptions.init(rawValue: 2))
            } catch {
                // Error Handling
                print("NSJSONSerialization Error")
                return
            }
            
        }
        
        if (WebConnection.sharedInstance.isInternetConnected())
        {
            
            
            session.dataTask(with: request, completionHandler: { (data : Data?, response : URLResponse?, error: Error?) in
                
                
                if data != nil {
                    
                    let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("Body: \(strData)")
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        {
                            //let success = json["success"] as? Int
                            // Okay, the `json` is here, let's get the value for 'success' out of it
                            //print("Success: \(success)")
                            print("jsonResponse is \(json)")
                            completionHandler(json)
                        }
                        else
                        {
                            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                            // No error thrown, but not NSDictionary
                            print("Error could not parse JSON: \(jsonStr)")
                            completionHandler(nil)
                        }
                    }
                    catch let parseError {
                        print(parseError)
                        // Log the error thrown by `JSONObjectWithData`
                        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        print("Error could not parse JSON: '\(jsonStr)'")
                        completionHandler(nil)
                    }
                } else {
                    completionHandler(nil)
                }
                
            }).resume()
            
            
          
            
        }
    }
    
    class func callUploadImageAtUrl(urlString:String,withArrayOfImages:[UIImage],completionHandler : @escaping (NSDictionary?, NSError?) -> Void){
        
        //  let finalString = String(format: "%@%@", arguments: [kAPIHost,urlString])
        //   let strServerUrl:NSURL = NSURL(string: finalString)!
        
        let request : URLRequest  = AFHTTPRequestSerializer().multipartFormRequest(withMethod: "POST", urlString: "http://zabius.com/uploadtest/serverupload/upload.php", parameters: nil, constructingBodyWith: { (formData:AFMultipartFormData) -> Void in
            
            for i in 1...withArrayOfImages.count {
                let image = withArrayOfImages [i-1] as UIImage
                let imageData = UIImageJPEGRepresentation(image, 0.6)
                
                let time : TimeInterval = NSDate().timeIntervalSince1970
                let nameOfImage = NSString(format: "%d-%d-%@",i, time, NSString(format: "image%d.jpeg", i))
                
                formData.appendPart(withFileData: imageData!, name: "uploaded_file", fileName: nameOfImage as String, mimeType: "image/jpeg")
            }
            
            }, error: nil) as URLRequest
        
        let manager : AFURLSessionManager = AFURLSessionManager(sessionConfiguration: URLSessionConfiguration())
        
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        let uploadTask : URLSessionUploadTask!
    
        uploadTask = manager.uploadTask(withStreamedRequest: request, progress: { (progresss : Progress) in
            
            }, completionHandler: { (response: URLResponse, data : Any?, err : Error?) in
                
                if err != nil {
                                        print(err.debugDescription)
                                        completionHandler(nil,err! as NSError?)
                    
                                    } else {
                                        print("image/images uploaded succesfully")
                                        let dict : NSDictionary = data as! NSDictionary
                                        completionHandler(dict,nil)
                                        
                                    }
        })
        
        uploadTask.resume()
        
        
    }
    
    class  func callUploadVideoAtUrl(urlString:String,withArrayOfVideoUrls:[NSURL],withParams:Dictionary<String, AnyObject>?, completionHandler : @escaping (NSDictionary?, NSError?,Double,Bool) -> Void){
        
        let finalString = String(format: "%@%@", arguments: [kAPIHost,urlString])
        
        if WebConnection.sharedInstance.isInternetConnected() == false
        {
            return
        }
        
        
        let  request : NSMutableURLRequest  = AFHTTPRequestSerializer().multipartFormRequest(withMethod: "POST", urlString: finalString, parameters: withParams, constructingBodyWith: { (formData:AFMultipartFormData) -> Void in
            
            
            for  i in  1...withArrayOfVideoUrls.count
            {
                let withUrlOfVideo = withArrayOfVideoUrls [i-1] as NSURL
                let time : TimeInterval = NSDate().timeIntervalSince1970
                let nameOfVideo = NSString(format: "%d-%d-%@",i, time, NSString(format: "video%d.mov", i))
                
                do{
                    try formData.appendPart(withFileURL: withUrlOfVideo as URL, name: "uploaded_file", fileName: nameOfVideo as String, mimeType: "video/mov")
                }
                catch
                {
                    print("error in form data")
                    
                }
                
            }
            
            }, error: nil)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        //[request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        
        
        request.timeoutInterval = 200
        
        let manager : AFURLSessionManager = AFURLSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        let uploadTask : URLSessionUploadTask!
        
   
        
        uploadTask = manager.uploadTask(withStreamedRequest: request as URLRequest, progress: { (progresss : Progress) in
            
            print("Progress\(progresss.fractionCompleted)")
            
            completionHandler(nil, nil,progresss.fractionCompleted,false)

            }, completionHandler: { (response: URLResponse, data : Any?, err : Error?) in
                
                if err != nil {
                    print(err.debugDescription)
                    completionHandler(nil,err! as NSError?,1,false)
                    
                } else {
                    print("video/videos uploaded succesfully")
                    let strData = NSString(data: (data! as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)
                    print("Body: \(strData)")
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: (data! as! NSData) as Data, options: []) as? NSDictionary
                        {
                            print("jsonResponse is \(json)")
                            completionHandler(json, nil,1,true)
                        }
                        
                    }
                    catch let parseError {
                        print(parseError)
                        // Log the error thrown by `JSONObjectWithData`
                        let jsonStr = NSString(data: (data! as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)
                        print("Error could not parse JSON: '\(jsonStr)'")
                        let errorInfo = NSError(domain: "error", code: 100, userInfo: nil)
                        completionHandler(nil,errorInfo,1,true)
                    }
                    //completionHandler(dict,nil)
                    
                }
        })

        
        uploadTask.resume()
        
        
    }
    

    
    
    
    
}
