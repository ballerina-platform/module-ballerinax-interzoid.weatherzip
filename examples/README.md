# Examples

The `ballerinax/interzoid.weatherzip` connector provides practical examples illustrating usage in various scenarios.

1. **[City weather report](https://github.com/ballerina-platform/module-ballerinax-interzoid.weatherzip/tree/main/examples/city_weather_report)** - Look up the current weather for a list of US zip codes and print a summary line for each.

2. **[Weather alert monitor](https://github.com/ballerina-platform/module-ballerinax-interzoid.weatherzip/tree/main/examples/weather_alert_monitor)** - Flag zip codes whose wind speed or temperature crosses configured thresholds.

## Prerequisites

1. Register for an Interzoid API license key at [Interzoid](https://www.interzoid.com/register-api-account).

2. For each example, create a `Config.toml` file with the related configuration. Here's an example of how your Config.toml file should look:

```toml
license = "<interzoid-license-key>"
zipCodes = "14201,10001"
```

Each example lists the additional values it needs in its own README.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
