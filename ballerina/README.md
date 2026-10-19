## Overview

The Interzoid Weather Zip connector lets Ballerina applications retrieve current weather conditions for a US zip code from the [Interzoid Current Weather Zip Code API](https://www.interzoid.com/apis/current-weather-zip-code). It supports version 1.0.0 of the API, which returns the city, state, temperature, conditions, wind, humidity, visibility, precipitation, wind chill and heat index for a given zip code.

### Key features

- Get current weather conditions for any US zip code
- Read temperature in both Fahrenheit and Celsius, along with wind speed, direction, humidity and visibility
- Check the remaining credits on your Interzoid API license with every call

## Setup guide

To use the connector, you need an Interzoid API license key.

1. Register for an account at [Interzoid](https://www.interzoid.com/register-api-account).

2. Copy the API license key issued for your account. The connector sends it in the `license` query parameter.

## Quickstart

To use the Interzoid Weather Zip connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/interzoid.weatherzip;
```

### Step 2: Create a `Config.toml` file

```toml
licenseKey = "<Interzoid API license key>"
```

### Step 3: Create a client

```ballerina
configurable string licenseKey = ?;

final weatherzip:Client interzoid = check new ({license: licenseKey});
```

### Step 4: Invoke an operation

```ballerina
public function main() returns error? {
    weatherzip:WeatherResponse _ = check interzoid->getWeatherByZipCode(zip = "14201");
}
```

## Examples

The `Interzoid Weather Zip` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-interzoid.weatherzip/tree/main/examples/), covering the following use cases:

1. [City weather report](https://github.com/ballerina-platform/module-ballerinax-interzoid.weatherzip/tree/main/examples/city_weather_report) - Look up the current weather for a list of US zip codes and print a summary line for each.
2. [Weather alert monitor](https://github.com/ballerina-platform/module-ballerinax-interzoid.weatherzip/tree/main/examples/weather_alert_monitor) - Flag zip codes whose wind speed or temperature crosses configured thresholds.
