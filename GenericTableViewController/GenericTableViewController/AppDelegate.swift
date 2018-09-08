//
//  GenericTableViewController
//
//  Copyright © 2018 Cölle Online. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let sampleEpisodes = [
		Episode(title: "First Episode"),
		Episode(title: "Second Episode"),
		Episode(title: "Third Episode")
	]
	let sampleSeasons = [
		Season(number: 1, title: "Season One"),
		Season(number: 2, title: "Season Two"),
		Season(number: 3, title: "Season Three")
	]


	func application (_ application: UIApplication,
	                  didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let seasonsVC = ItemsViewController(items: sampleSeasons,
			configure: {
				(cell: SeasonCell, season) in
				cell.textLabel?.text = season.title
				cell.detailTextLabel?.text = "\(season.number)"
			})
		seasonsVC.title = "Seasons"
		let nc = UINavigationController(rootViewController: seasonsVC)

		seasonsVC.didSelect = { (season) in
			let episodesVC = ItemsViewController(items: self.sampleEpisodes, configure: {
				cell, episode in
				cell.textLabel?.text = episode.title
			})
			episodesVC.title = season.title
			nc.pushViewController(episodesVC, animated: true)
		}

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = nc
		window?.makeKeyAndVisible()
		return true
	}
}
