# City weather report

This example looks up the current weather for a list of US zip codes and prints a one-line summary for each, failing if the API does not report success.

## Prerequisites

### 1. Get an Interzoid API license key

Register for an API key at [Interzoid](https://www.interzoid.com/register-api-account).

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
license = "<interzoid-license-key>"
zipCodes = "14201,10001"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
