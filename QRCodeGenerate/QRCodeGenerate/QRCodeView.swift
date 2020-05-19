//
//  QRCodeView.swift
//  QRCodeGenerate
//
//  Created by Алексей Макаров on 19.05.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

final class QRCode {
  
  func generateQRCode(from string: String, completion: @escaping (UIImage?) -> Void) {
    let data = string.data(using: String.Encoding.ascii)
    
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
      filter.setValue(data, forKey: "inputMessage")
      let transform = CGAffineTransform(scaleX: 1, y: 1)
      
      if let output = filter.outputImage?.transformed(by: transform) {
        let image = UIImage(ciImage: output)
        completion(image)
      }
    }
    completion(nil)
  }
  
}

