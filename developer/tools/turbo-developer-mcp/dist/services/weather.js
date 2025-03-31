class WeatherService {
    constructor() {
        this.apiKey = 'dummy-api-key';
    }
    async getWeather(city, country) {
        // In a real implementation, we would make an API call here
        // For demo purposes, we'll just return mock data
        // Simulate network delay
        await new Promise(resolve => setTimeout(resolve, 500));
        // Mock data based on city
        return {
            location: {
                name: city,
                country: country || 'Unknown'
            },
            current: {
                temperature: Math.round(15 + Math.random() * 15),
                condition: this.getRandomCondition(),
                humidity: Math.round(30 + Math.random() * 70),
                windSpeed: Math.round(5 + Math.random() * 25)
            },
            forecast: this.generateForecast()
        };
    }
    getRandomCondition() {
        const conditions = [
            'Sunny', 'Partly cloudy', 'Cloudy', 'Overcast',
            'Mist', 'Light rain', 'Moderate rain', 'Heavy rain',
            'Light snow', 'Moderate snow', 'Heavy snow', 'Thunderstorm'
        ];
        return conditions[Math.floor(Math.random() * conditions.length)];
    }
    generateForecast() {
        const forecast = [];
        const today = new Date();
        for (let i = 1; i <= 5; i++) {
            const forecastDate = new Date(today);
            forecastDate.setDate(today.getDate() + i);
            const maxTemp = Math.round(15 + Math.random() * 15);
            forecast.push({
                date: forecastDate.toISOString().split('T')[0],
                maxTemp,
                minTemp: Math.round(maxTemp - 5 - Math.random() * 5),
                condition: this.getRandomCondition()
            });
        }
        return forecast;
    }
}
export const weatherService = new WeatherService();
//# sourceMappingURL=weather.js.map