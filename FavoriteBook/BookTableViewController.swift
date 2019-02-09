
import UIKit;

class BookTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let bookCell = "BookCell";
        static let addBookSegue = "AddBook";
        static let editBookSegue = "EditBook";
    }
    
    var books: [Book] = [Book]();
    
    var bookArchiveURL: URL {
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
        return documentsURL.appendingPathComponent("books");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.leftBarButtonItem = editButtonItem;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        tableView.reloadData();
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //p. 648
        guard let cell: BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.bookCell, for: indexPath) as? BookTableViewCell else {
            fatalError("could not downcast UITableViewCell to BookTableViewCell");
        }
        
        let book: Book = books[indexPath.row];
        cell.update(with: book);   //p. 648
        return cell;
    }
    
    // MARK: - Navigation
    
    //Arrive here when returning from the form that displays one book.
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard let source: BookFormTableViewController = segue.source as? BookFormTableViewController,
            let book: Book = source.book else {
                return;
        }
        
        if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
            ///Just edited an existing book.
            books.remove(at: indexPath.row);
            books.insert(book, at: indexPath.row);
            tableView.deselectRow(at: indexPath, animated: true);
        } else {
            //Just added a new book.
            books.append(book);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bookFormViewController: BookFormTableViewController = segue.destination as? BookFormTableViewController else {
            return;
        }
        
        if let indexPath: IndexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editBookSegue {
            bookFormViewController.book = books[indexPath.row];
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            books.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .automatic);
        }
    }
    
}
