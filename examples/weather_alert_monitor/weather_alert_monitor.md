# Weather alert monitor

This example checks the current weather for a list of US zip codes and prints an alert for each one whose wind speed is above, or temperature is below, the configured thresholds.

## Prerequisites

### 1. Get an Interzoid API license key

Register for an API key at [Interzoid](https://www.interzoid.com/register-api-account).

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
license = "<interzoid-license-key>"
zipCodes = "14201,10001"
maxWindMph = 25
minTempF = 20
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
