//
//  MovieService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

protocol MovieService {
	func searchMovies(searchQuery: String, completion: @escaping (SearchResponse?) -> Void)
}
