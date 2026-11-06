// Flags zip codes whose current conditions cross configured wind and temperature thresholds.

import ballerina/io;
import ballerinax/interzoid.weatherzip;

configurable string license = ?;
configurable string zipCodes = ?;
configurable decimal maxWindMph = 25;
configurable decimal minTempF = 20;

public function main() returns error? {
    weatherzip:Client weatherClient = check new ({license});
    int alertCount = 0;

    string[] zipList = re `,`.split(zipCodes).map(z => z.trim());
    foreach string zip in zipList {
        weatherzip:WeatherResponse weather = check weatherClient->getWeatherByZipCode(zip = zip);
        string? windValue = weather.windMPH;
        string? tempValue = weather.tempF;
        if windValue is () || tempValue is () {
            return error(string `Weather lookup for ${zip} returned no wind or temperature data`);
        }
        decimal windMph = check decimal:fromString(windValue);
        decimal tempF = check decimal:fromString(tempValue);

        if windMph > maxWindMph {
            alertCount += 1;
            io:println(string `ALERT ${zip}: wind ${windMph} mph exceeds ${maxWindMph} mph`);
        }
        if tempF < minTempF {
            alertCount += 1;
            io:println(string `ALERT ${zip}: temperature ${tempF}F is below ${minTempF}F`);
        }
    }
    io:println(string `Checked ${zipList.length()} zip codes, ${alertCount} alert(s) raised`);
}
