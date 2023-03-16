//
//  APIService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

protocol APIRequest {
	var baseURL: URL { get }
	var path: String { get }
	var method: String { get }
	var urlParameters: [String: String] { get }
}

protocol APIService {
	func makeRequest(
		request: APIRequest,
		completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
	)
}
