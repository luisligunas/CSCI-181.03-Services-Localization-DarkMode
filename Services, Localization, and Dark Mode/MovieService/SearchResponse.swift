//
//  SearchResponse.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

struct SearchResponse: Codable {
	let totalResults: String
	let response: String
	let search: [Movie]

	enum CodingKeys: String, CodingKey {
		case totalResults
		case response = "Response"
		case search = "Search"
	}
}

struct Movie: Codable {
	let title: String
	let year: Int
	let imdbID: String
	let type: MovieType
	let poster: String

	init(title: String, year: Int, imdbID: String, type: MovieType,  poster: String) {
		self.title = title
		self.year = year
		self.imdbID = imdbID
		self.type = .hello
		self.poster = poster
	}

	enum CodingKeys: String, CodingKey {
		case title = "Title"
		case year = "Year"
		case imdbID
		case type = "Type"
		case poster = "Poster"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.year = Int(try container.decode(String.self, forKey: .year)) ?? 0
		self.imdbID = try container.decode(String.self, forKey: .imdbID)
		self.type = try container.decode(MovieType.self, forKey: .type)
		self.poster = try container.decode(String.self, forKey: .poster)
	}
}

enum MovieType: String, Codable {
	case hello = "movie"
	case show = "series"
}
