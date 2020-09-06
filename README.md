# elasticsearch 7 and elastic stck

## Section 1

Mainly you will be checking setup and basic operations in elasticsearch.

To download shakespeare mapping and data you can execute:

```sh
./scripts/download_shakespeare.sh
```

To create shakespeare index and load data, execute:

```sh
export ES_USERNAME=your-es-user
export ES_PASSWORD=your-es-pass
./scripts/populate_shakespeare.sh
```
