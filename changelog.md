# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `GetWeatherByZipCodeQueries`, the record that carries the query parameters of `getWeatherByZipCode`.
- The `windChill`, `heatIndex` and `precipitationLastHour` fields of `WeatherResponse`.
- An optional `headers` parameter on the remote method, for sending extra request headers.
- New `ConnectionConfig` fields, taken from `http:ClientConfiguration`: `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`.
- Documentation for the fields of `WeatherResponse`.

### Changed

- **Breaking:** `getweatherzipcode(string zip)` is now `getWeatherByZipCode(*GetWeatherByZipCodeQueries queries)`. The zip code is passed as a named argument (or as a `GetWeatherByZipCodeQueries` record):

    ```ballerina
    // 1.5.2
    weatherzip:WeatherData weather = check weatherZip->getweatherzipcode("98109");
    ```

    ```ballerina
    // 2.0.0
    weatherzip:WeatherResponse weather = check weatherZip->getWeatherByZipCode(zip = "98109");
    ```

- **Breaking:** the `WeatherData` record is renamed to `WeatherResponse`.
- **Breaking:** record fields use camel case, mapped to the API's Pascal-case JSON names with `@jsondata:Name`. For example, `TempC` is now `tempC`, `WindMPH` is now `windMPH`, and `RelativeHumidity` is now `relativeHumidity`.
- **Breaking:** `ConnectionConfig.http1Settings` is now `http:ClientHttp1Settings` (was the connector's own `ClientHttp1Settings`).
- `ConnectionConfig.timeout` defaults to 30 seconds (was 60).

### Removed

- **Breaking:** the connector's own `ClientHttp1Settings` and `ProxyConfig` records. Use `http:ClientHttp1Settings` and `http:ProxyConfig` instead.
- **Breaking:** the `AirQuality`, `AirQualityIndex`, `AirQualityCode`, `Sunrise` and `Sunset` fields of the weather record.
