//
//  EntryDetailViewController.swift
//  Journal+NSFRC27
//
//  Created by Jason Mandozzi on 6/20/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var entry: Entry?
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        designClearButton()
    }
    func updateViews() {
        guard let entry = entry else {return}
        entryTitleTextField.text = entry.title
        entryBodyTextView.text = entry.body
    }
    
    func designClearButton() {
        clearButton.layer.cornerRadius = clearButton.frame.height / 2
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.black.cgColor
        clearButton.setTitle("Clear Text", for: .normal)
        clearButton.backgroundColor = .purple
        clearButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        entryTitleTextField.text = ""
        entryBodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let entryText = entryTitleTextField.text, let bodyText = entryBodyTextView.text else {return}
        
        if let entry = entry {
            //entry has a vlaue, so user wants to update
            EntryController.sharedInstance.updateEntry(entry: entry, newTitle: entryText, newBody: bodyText)
        } else {
            //entry is nil, so user wants to creat a new entry
            EntryController.sharedInstance.createEntry(withTitle: entryText, body: bodyText)
        }
        navigationController?.popViewController(animated: true)

    }
}
