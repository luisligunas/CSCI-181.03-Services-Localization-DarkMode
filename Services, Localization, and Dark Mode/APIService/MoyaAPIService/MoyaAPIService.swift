//
//  MoyaAPIService.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation
import Moya

class MoyaAPIService: APIService {
	func makeRequest(
		request: APIRequest,
		completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
	) {
		let targetType = DefaultTargetType(
			with: request.baseURL,
			path: request.path,
			method: request.method,
			urlParameters: request.urlParameters
		)
		let provider = MoyaProvider<DefaultTargetType>()
		provider.request(targetType) { result in
			switch result {
			case .success(let response):
				completionHandler(response.data, response.response, nil)
			case .failure(let error):
				completionHandler(nil, error.response?.response, error)
			}
		}
	}
}
