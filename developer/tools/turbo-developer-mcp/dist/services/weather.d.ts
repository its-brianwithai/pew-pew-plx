interface WeatherData {
    location: {
        name: string;
        country: string;
    };
    current: {
        temperature: number;
        condition: string;
        humidity: number;
        windSpeed: number;
    };
    forecast: Array<{
        date: string;
        maxTemp: number;
        minTemp: number;
        condition: string;
    }>;
}
declare class WeatherService {
    private apiKey;
    getWeather(city: string, country?: string): Promise<WeatherData>;
    private getRandomCondition;
    private generateForecast;
}
export declare const weatherService: WeatherService;
export {};
