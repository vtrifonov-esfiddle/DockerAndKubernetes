export class CounterService { 
    private getEndpointUri(endpointUri: string){
        return `${SQL_SERVER_WEB_API_URI}/${endpointUri}`;
    }
    
    getCounter(): Promise<number> {
        return fetch(this.getEndpointUri('Counter'), { method: 'GET'})
            .then(response => 
                response.json().then((count: number) => count)
            );
    }

    updateCounter(count: number): Promise<void> {     
        return fetch(this.getEndpointUri(`Counter/${count}`), {
            method: 'POST'
        }).then(response => {
            return;
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