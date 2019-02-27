import * as React from 'react';
import { RouteComponentProps } from 'react-router';
import { CounterService } from './CounterService';

interface CounterState {
    currentCount: number;
}

export class Counter extends React.Component<RouteComponentProps<{}>, CounterState> {
    constructor() {
        super();        
        this.counterService = new CounterService();
        this.state = { currentCount: 0 };
        this.counterService.getCounter().then(count => this.updateCounter(count));
    }

    private counterService: CounterService;

    public render() {
        return <div>
            <h1>Counter</h1>

            <p>This is a simple example of a React component.</p>

            <p>Current count: <strong>{ this.state.currentCount }</strong></p>

            <button onClick={ () => {
                const increasedCount: number = this.state.currentCount + 1;
                this.updateCounter(increasedCount);
                this.counterService.updateCounter(increasedCount);
            } }>Increment</button>
        </div>;
    }

    private updateCounter(count: number) {
        this.setState({
            currentCount: count
        });
    }
}
