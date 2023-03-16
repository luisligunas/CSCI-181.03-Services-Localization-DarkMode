//
//  APIMovieService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

class APIMovieService: MovieService {
	let apiService: APIService

	init(apiService: APIService) {
		self.apiService = apiService
	}

	func searchMovies(searchQuery: String, completion: @escaping (SearchResponse?) -> Void) {
		let request = MovieAPI.search(query: searchQuery)
		apiService.makeRequest(request: request) { data, response, error in
			var searchResponse: SearchResponse?
			defer { completion(searchResponse) }
			data.map {
				print("Data: \(String(data: $0, encoding: .utf8) ?? "null")")
			}

			if error != nil {
				return
			}
			guard let httpResponse = response as? HTTPURLResponse,
				  (200...299).contains(httpResponse.statusCode)
			else {
				return
			}

			if let data = data,
			   let response = try? JSONDecoder().decode(SearchResponse.self, from: data) {
				searchResponse = response
			}
		}
	}
}
