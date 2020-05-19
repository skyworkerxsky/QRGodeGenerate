//
//  ViewController.swift
//  QRCodeGenerate
//
//  Created by Алексей Макаров on 19.05.2020.
//  Copyright © 2020 Алексей Макаров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  
  private let qrCode = QRCode()
  
  // MARK: - UI
  
  private(set) lazy var qrImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  private(set) lazy var titleLText: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment = .center
    textView.isScrollEnabled = false
    textView.isUserInteractionEnabled = true
    textView.isEditable = false
    textView.textColor = .systemPink
    textView.dataDetectorTypes = UIDataDetectorTypes.link
    textView.textColor = .systemPink
    textView.font = UIFont.systemFont(ofSize: 20)
    return textView
  }()
  
  // MARK: - Life
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    layout()
  }
  
  // MARK: - Functions
  
  private func createUI() {
    view.addSubview(qrImage)
    view.addSubview(titleLText)
  }
  
  private func configureUI() {
    
    view.backgroundColor = .white

    let text = "https://tjournal.ru"
    
    titleLText.text = text
    
    qrCode.generateQRCode(from: text, completion: { [weak self] (img) in
      guard let image = img else { return }
      self?.qrImage.image = image
    })
  }
  
  private func layout() {
    
    qrImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    qrImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    qrImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    qrImage.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    
    titleLText.topAnchor.constraint(equalTo: qrImage.bottomAnchor, constant: 20).isActive = true
    titleLText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    titleLText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
  }
  
}

