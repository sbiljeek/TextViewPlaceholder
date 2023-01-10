//
//  ViewController.swift
//  TextViewPlaceholder
//
//  Created by Salman Biljeek on 1/10/23.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    let topAndBottomInset: CGFloat = 9
    let leadingAndTrailingInset: CGFloat = 12
    let font: UIFont = .systemFont(ofSize: 16)
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .init(top: self.topAndBottomInset, left: self.leadingAndTrailingInset, bottom: self.topAndBottomInset, right: self.leadingAndTrailingInset)
        textView.delegate = self
        textView.font = self.font
        textView.textColor = .label
        textView.backgroundColor = .secondarySystemBackground
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 14
        textView.clipsToBounds = true
        textView.isScrollEnabled = true
        textView.scrollIndicatorInsets = .init(top: 4, left: 0, bottom: 4, right: 4)
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return textView
    }()
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder"
        label.font = self.font
        label.textColor = .tertiaryLabel
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        textView.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: self.leadingAndTrailingInset).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -self.leadingAndTrailingInset).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: self.topAndBottomInset).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.updateTextViewPlaceholder(textView)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.updateTextViewPlaceholder(textView)
    }
    
    fileprivate func updateTextViewPlaceholder(_ textView: UITextView) {
        placeholderLabel.isHidden = textView.text.count != 0
    }
}

