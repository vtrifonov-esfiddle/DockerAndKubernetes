export class ForecastsService { 
    private getEndpointUri(endpointUri: string){
        const webApiUri: string = 'http://localhost:49998';
        return `${webApiUri}/${endpointUri}`;
    }
    
    getForecasts(): Promise<IWeatherForecast[]> {
        return fetch(this.getEndpointUri('WeatherForecasts'), { method: 'GET'})
            .then(response => 
                response.json().then((weatherForecasts: IWeatherForecast[]) => weatherForecasts)
            );
    }

    addRandomForecast(): Promise<IWeatherForecast> {     
        return fetch(this.getEndpointUri('WeatherForecasts'), {
            method: 'POST'   
        }).then(response => {
            return response.json().then((newWeatherForecast: IWeatherForecast) => {
                return newWeatherForecast;
            });
        });
    }
}

export interface IWeatherForecast {
    id: string;
    dateFormatted: string;
    temperatureC: number;
    temperatureF: number;
    summary: string;
}