//
//  DefaultTargetType.swift
//  SingletonsAndServices
//
//  Created by Luis Ligunas on 3/15/23.
//

import Foundation
import Moya

struct DefaultTargetType: TargetType {
	var baseURL: URL
	var path: String
	var method: Moya.Method
	var task: Moya.Task

	var sampleData: Data  = Data()
	var headers: [String : String]? = nil

	init(with baseURL: URL, path: String, method: String, urlParameters: [String: Any]) {
		self.baseURL = baseURL
		self.path = path
		self.method = Moya.Method(rawValue: method) ?? .get
		self.task = .requestParameters(parameters: urlParameters, encoding: URLEncoding.default)
	}
}
