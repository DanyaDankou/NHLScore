//
//  URLRequest.swift
//  NHLScore
//
//  Created by comp on 28.01.23.
//

import Foundation

func getTeamsURL() -> URL? {
    let teamsURLString = APIConstants.baseURL + APIConstants.teamsEndpoint
    return URL(string: teamsURLString)
}

func getScheduleURL(for teamID: Int) -> URL? {
    let scheduleURLString = APIConstants.baseURL + APIConstants.teamsEndpoint + "/\(teamID)" + APIConstants.scheduleEndpoint
    return URL(string: scheduleURLString)
}

func getStandingsURL() -> URL? {
    let standingsURLString = APIConstants.baseURL + APIConstants.standingsEndpoint
    return URL(string: standingsURLString)
}

func getPlayersURL(for teamID: Int) -> URL? {
    let playersURLString = APIConstants.baseURL + APIConstants.teamsEndpoint + "/\(teamID)" + APIConstants.playersEndpoint
    return URL(string: playersURLString)
}

func getStatisticsURL(for playerID: Int) -> URL? {
    let statisticsURLString = APIConstants.baseURL + APIConstants.statisticsEndpoint
    return URL(string: statisticsURLString)
}
