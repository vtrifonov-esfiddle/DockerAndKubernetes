import * as React from 'react';
import { RouteComponentProps } from 'react-router';
import 'isomorphic-fetch';
import { IWeatherForecast, ForecastsService } from './ForecastsService';

interface FetchDataExampleState {
    forecasts: IWeatherForecast[];
    loading: boolean;
}

export class FetchData extends React.Component<RouteComponentProps<{}>, FetchDataExampleState> {
    constructor() {
        super();
        this.loadWeatherForecasts();
        this.forecastsService = new ForecastsService();
    }

    private forecastsService: ForecastsService;

    private loadWeatherForecasts() {
        this.state = { forecasts: [], loading: true };
        this.forecastsService.getForecasts().then(forecasts => {
            this.setState({ forecasts: forecasts, loading: false });            
        });        
    }

    public render() {
        let contents = this.state.loading
            ? <p><em>Loading...</em></p>
            : FetchData.renderForecastsTable(this.state.forecasts);

        return <div>
            <h1>Weather forecast</h1>
            <button className={'btn btn-primary'} onClick={ () => { this.addRandomForecast() } }>Add Random Forecast</button>
            <p>This component demonstrates fetching data from the server.</p>
            { contents }
        </div>;
    }

    private addRandomForecast(): void {     
        this.forecastsService.addRandomForecast().then((newForecast: IWeatherForecast) => {
            this.setState({
                forecasts: [newForecast,...this.state.forecasts]
            });
        });
    }

    private static renderForecastsTable(forecasts: IWeatherForecast[]) {
        return <table className='table'>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Temp. (C)</th>
                    <th>Temp. (F)</th>
                    <th>Summary</th>
                </tr>
            </thead>
            <tbody>
            {forecasts.map(forecast =>
                <tr key={ forecast.id }>
                    <td>{ forecast.dateFormatted }</td>
                    <td>{ forecast.temperatureC }</td>
                    <td>{ forecast.temperatureF }</td>
                    <td>{ forecast.summary }</td>
                </tr>
            )}
            </tbody>
        </table>;
    }
}