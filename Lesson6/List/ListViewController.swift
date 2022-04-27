import UIKit

class ListViewController: UIViewController {
    
    var output: ListViewOutput?
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    var artists: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewIsReady()
        setupViews()
    }
}

// MARK: - Setup views
private extension ListViewController {
    func setupViews() {
        view.backgroundColor = .white
        title = "Artists"
        
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Setup UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = artists[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let artist = artists[indexPath.row]
        let viewController = DetailAssembly.assemble(artist: artist)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - ListViewInput
extension ListViewController: ListViewInput {
    func reload(_ artists: [Artist]) {
        self.artists = artists
        self.tableView.reloadData()
    }
}
