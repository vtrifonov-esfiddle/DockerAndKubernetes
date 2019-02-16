export class ForecastsService { 
    private getEndpointUri(endpointUri: string){
        return `${MONGO_DB_WEB_API_URI}/${endpointUri}`;
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