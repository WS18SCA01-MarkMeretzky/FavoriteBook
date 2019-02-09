//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Mark Meretzky on 2/8/19.
//

import UIKit;

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!;   //p. 648
    @IBOutlet weak var authorLabel: UILabel!;
    @IBOutlet weak var genreLabel: UILabel!;
    @IBOutlet weak var lengthLabel: UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {   //p. 648
        titleLabel.text = book.title;
        authorLabel.text = book.author;
        genreLabel.text = book.genre;
        lengthLabel.text = book.length;
    }

}
