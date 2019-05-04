//
//  SaverError.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import Foundation
import UIKit

struct SaverError: CustomStringConvertible {
    let message: String?, code: Int?
    
    init(message: String? = nil, code: Int? = nil) {
        self.message = message
        self.code = code
    }
    
    init(from errorDictionary: [String: AnyObject]) {
        self.init(message: errorDictionary["message"] as? String, code: errorDictionary["code"] as? Int)
    }
    
    var errorMessage: String {
        return message ?? "An unknown error occurred"
    }
    
    var description: String {
        return "TSS Saver error: \(message ?? "No error message")\(code != nil ? " (Error code: \(code!))" : "")"
    }
    
    var alertController: UIAlertController {
        let alert = UIAlertController(title: "An error occured", message: "\(self.description)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        return alert
    }
}
