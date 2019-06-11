//
//  Extensions.swift
//  PetsDex
//
//  Created by Katheryne Graf on 17/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.DataResponse {
    func debugLog() {
        var output: [String] = []
        var datastring = ""
        if let body = request?.httpBody {
            datastring = NSString(data: body, encoding: String.Encoding.utf8.rawValue)! as String
        }
        if let header = request?.allHTTPHeaderFields {
            print(header)
        }
        
        output.append(request != nil ? "[Request]: \(request!)" : "[Request]: nil")
        output.append("[Method]: \(String(describing: request?.httpMethod))")
        output.append("[Body]: \(datastring)")
        output.append("[Result]: \(result.debugDescription)")
        print(output.joined(separator: "\n"))
    }
}

extension UIViewController{
    func showAlert(_ title: String!,
                   _ message : String!,
                   dismissAfter secs: Double = 0.0,
                   buttonTitle btitle: String = "OK",
                   completion: @escaping () -> Void = {}) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if secs == 0 {
            let ok = UIAlertAction(title: btitle, style: .default, handler: {action in  completion() })
            alertController.addAction(ok)
        }
        
        self.present(alertController, animated: true, completion: nil)
        
        
        if secs > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + secs) {
                alertController.dismiss(animated: true, completion: { completion() })
            }
        }
    }
}
