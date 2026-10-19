// Prints a current weather summary for a list of US zip codes.

import ballerina/io;
import ballerinax/interzoid.weatherzip;

configurable string license = ?;
configurable string zipCodes = ?;

public function main() returns error? {
    weatherzip:Client weatherClient = check new ({license});

    string[] zipList = re `,`.split(zipCodes).map(z => z.trim());
    foreach string zip in zipList {
        weatherzip:WeatherResponse weather = check weatherClient->getWeatherByZipCode(zip = zip);
        if weather.code != "Success" {
            return error(string `Weather lookup for ${zip} failed with code ${weather.code ?: "unknown"}`);
        }
        io:println(string `${weather.city ?: "Unknown"}, ${weather.state ?: ""} (${zip}): ${weather.weather ?: "n/a"}, ` +
                string `${weather.tempF ?: "n/a"}F / ${weather.tempC ?: "n/a"}C, humidity ${weather.relativeHumidity ?: "n/a"}%`);
    }
}
