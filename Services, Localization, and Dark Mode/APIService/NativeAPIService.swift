//
//  NativeAPIService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation

class NativeAPIService: APIService {
	func makeRequest(
		request: APIRequest,
		completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void
	) {
		var url = request.baseURL.appending(path: request.path)
		url.append(queryItems: request.urlParameters.map { key, value in
			URLQueryItem(name: key, value: value)
		})
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method
		let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completionHandler)
		task.resume()
	}
}


