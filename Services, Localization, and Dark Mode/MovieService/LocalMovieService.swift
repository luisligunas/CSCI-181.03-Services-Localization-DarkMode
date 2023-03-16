//
//  LocalMovieService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

class LocalMovieService: MovieService {
	func updateDataFromFile() {
		// Doing things here
	}

	func searchMovies(searchQuery: String, completion: @escaping (SearchResponse?) -> Void) {
		completion(SearchResponse(totalResults: "10", response: "12", search: [
			Movie(title: "One", year: 1, imdbID: "3", type: .hello, poster: ""),
			Movie(title: "Two", year: 1, imdbID: "3", type: .hello, poster: ""),
			Movie(title: "Three", year: 1, imdbID: "3", type: .hello, poster: ""),
			Movie(title: "Four", year: 1, imdbID: "3", type: .hello, poster: ""),
		]))
	}
}
