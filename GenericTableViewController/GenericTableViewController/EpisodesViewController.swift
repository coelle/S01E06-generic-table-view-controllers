//
//  GenericTableViewController
//
//  Copyright © 2018 Cölle Online. All rights reserved.
//

import UIKit

struct Episode {
	var title: String
}

class EpisodesViewController: UITableViewController {
	private let reuseIdentifier = "Cell"

	private var episodes: [Episode] = []

	init (episodes: [Episode]) {
		super.init(style: .plain)
		self.episodes = episodes
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad () {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
	}

	override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return episodes.count
	}

	override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let item = episodes[indexPath.row]
		cell.textLabel?.text = item.title
		return cell
	}
}
