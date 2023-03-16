//
//  MovieAPI.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

enum MovieAPI: APIRequest {
	case search(query: String)

	var baseURL: URL {
		switch self {
		case .search:
			return URL(string: "https://www.omdbapi.com")!
		}
	}
	var path: String {
		switch self {
		case .search:
			return ""
		}
	}
	var method: String {
		switch self {
		case .search:
			return "get"
		}
	}
	var urlParameters: [String: String] {
		switch self {
		case .search(let query):
			return [
				"apikey": "afd88f51",
				"s": query
			]
		}
	}
}
