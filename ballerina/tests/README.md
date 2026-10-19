# Running Tests

## Prerequisites

An Interzoid API license key is needed only for the live tests.

## Test environments

The tests run against a mock server by default and can run against the live Interzoid API.

| Test group | Environment |
|---|---|
| `mock_tests` | Mock server on `http://localhost:9090` (default) |
| `live_tests` | `https://api.interzoid.com` |

## Running the tests

### Mock server

```bash
bal test
```

### Live server

```bash
export IS_LIVE_SERVER=true
export INTERZOID_LICENSE="<Interzoid API license key>"
bal test
```
