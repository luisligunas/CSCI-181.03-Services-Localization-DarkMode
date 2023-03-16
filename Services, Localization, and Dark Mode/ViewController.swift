//
//  ViewController.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import UIKit

class ViewController: UIViewController {
	let movieService: MovieService = APIMovieService(apiService: NativeAPIService())
//	let movieService: MovieService = APIMovieService(apiService: MoyaAPIService())
//	let movieService: MovieService = LocalMovieService()

	override func viewDidLoad() {
		super.viewDidLoad()

		printLocalizedString()
		print("------------------------------------------")
		printLocalizedFormattedString(value: 133.31)
		print("------------------------------------------")
		printMovieList()
	}

	private func printMovieList() {
		let searchQuery = "Harry Potter"
		movieService.searchMovies(searchQuery: searchQuery) { response in
			guard let response = response else {
				print("Loading failed!")
				return
			}
			response.search.forEach { movie in
				print(movie.title)
			}
		}
	}

	private func printLocalizedFormattedString(value: Double) {
		let formatString = NSLocalizedString("cups_of_rice_eaten", comment: "")
		let formattedString = String(format: formatString, value)
		print(formattedString)
	}

	private func printLocalizedString() {
		let localizedString = NSLocalizedString("test_string", comment: "")
		print(localizedString)
	}
}
