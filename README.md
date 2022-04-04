# Envsubst Action 

This action allows you to substitute environment variables in a file.

## Usage

### Single file
deployment.json (BEFORE)
```json
{
  "version": "${VERSION}",
  "instance": "${INSTANCE}"
}
```

ACTION
```yaml
- uses: danielr1996/envsubst-action@1.0.0
  env:
      VERSION: 1.2.3
      INSTANCE: staging
  with:
    files: |
      deployment.json
```


deployment.json (AFTER)
```json
{
  "version": "1.2.3",
  "instance": "staging"
}
```

### Multiple files

ACTION
```yaml
- uses: danielr1996/envsubst-action@1.0.0
  env:
      VERSION: 1.2.3
      INSTANCE: staging
  with:
    files: |
      deployment.json
      test.json
      apps/Dockerfile
```


### Replace only defined variables
by listing varaibles you want to have replaced you can override default behaviour of envsubst which does replace all found $VAR / ${VAR} string even if there is no matching Environmental variable

ACTION
```yaml
- uses: danielr1996/envsubst-action@1.0.0
  env:
      VERSION: 1.2.3
      INSTANCE: staging
      USER: devops
  with:
    variables: |
      $VERSION
      $INSTANCE
    files: |
      deployment.json
      test.json
      apps/Dockerfile
```
