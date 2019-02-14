import * as React from 'react';
import { RouteComponentProps } from 'react-router';
import 'isomorphic-fetch';

interface FetchDataExampleState {
    forecasts: WeatherForecast[];
    loading: boolean;
}

export class FetchData extends React.Component<RouteComponentProps<{}>, FetchDataExampleState> {
    constructor() {
        super();
        this.loadWeatherForecasts();
    }

    private getWebApiEndpoint(endpointUri: string){
        const webApiUri: string = 'http://localhost:49998';
        return `${webApiUri}/${endpointUri}`;
    } 

    private loadWeatherForecasts() {
        this.state = { forecasts: [], loading: true };
        fetch(this.getWebApiEndpoint('WeatherForecasts'))
            .then(response => response.json())
            .then(data => {
                this.setState({ forecasts: data, loading: false });
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
        fetch(this.getWebApiEndpoint('WeatherForecasts'), {
            method: 'POST'   
        }).then(response => {
            response.json().then(data => {
                this.setState({
                    forecasts: [data,...this.state.forecasts]
                });                    
            });
            }
        );
    }

    private static renderForecastsTable(forecasts: WeatherForecast[]) {
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

interface WeatherForecast {
    id: string;
    dateFormatted: string;
    temperatureC: number;
    temperatureF: number;
    summary: string;
}
