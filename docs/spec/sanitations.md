_Author_:  @DimuthuMadushan \
_Created_: 2026/10/19 \
_Updated_: 2026/10/19 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Interzoid Weather Zip.
The OpenAPI specification is obtained from [Interzoid Weather Zip OpenAPI specification](https://github.com/wso2/api-specs/blob/main/openapi/interzoid/weatherzip/1.0.0/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. The `openapi` version was changed from `3.1.0` to `3.0.3` in the original spec (`docs/spec/openapi.yaml`). The Ballerina OpenAPI flatten and align tools drop the `type` of every schema and parameter in a 3.1.0 document, which generates `anydata` fields and parameters in the client.

2. The `license` query parameter was removed from `getWeatherByZipCode` in the original spec (`docs/spec/openapi.yaml`). It duplicates the `apiKeyAuth` security scheme, which already sends the key in the `license` query parameter, and would force callers to pass the license twice.

3. The `examples` map on the `zip` query parameter was replaced by a single `example` value in the original spec (`docs/spec/openapi.yaml`), the form that OpenAPI 3.0.3 allows on a parameter.

4. A `description` was added to the `apiKeyAuth` security scheme in the original spec (`docs/spec/openapi.yaml`), so the generated `ApiKeysConfig` field is documented.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --client-methods remote --license docs/license.txt -o ballerina
```

Note: The license year is hardcoded to 2026, change if necessary.
