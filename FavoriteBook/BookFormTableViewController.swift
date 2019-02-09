//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Mark Meretzky on 2/8/19.
//

import UIKit;

class BookFormTableViewController: UITableViewController {
    var book: Book? = nil;   //p. 647
    
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable";
    }

    @IBOutlet weak var titleTextField: UITextField!;   //p. 646
    @IBOutlet weak var authorTextField: UITextField!;
    @IBOutlet weak var genreTextField: UITextField!;
    @IBOutlet weak var lengthTextField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let title: String = titleTextField.text,   //p. 647
            let author: String = authorTextField.text,
            let genre: String = genreTextField.text,
            let length: String = lengthTextField.text else {
                return;
        }
        
        book = Book(title: title, author: author, genre: genre, length: length);
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self);
    }
    
    func updateView() {   //p. 646
        guard let book: Book = book else {
            return;
        }
        
        titleTextField.text = book.title;
        authorTextField.text = book.author;
        genreTextField.text = book.genre;
        lengthTextField.text = book.length;
    }
}
