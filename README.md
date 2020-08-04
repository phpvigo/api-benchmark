# Api Benchmark

## Up the containers

```bash
docker-compose up
```

## Run the benchmarks

### Vegeta

500 concurrency each second during 10 seconds.

```bash
 docker-compose exec vegeta sh benchmark.sh
```

See results: http://localhost:8080/

### Apache benchmark

5000 request with 100 concurrency.

```bash
 docker-compose exec ab sh benchmark.sh
```

See results: http://localhost:8081/

## Endpoints

### Get all provinces

- ReactPHP  http://localhost:8000/provinces  
- Symfony5  http://localhost:8001/provinces

## Database used

We use the Spain ZipCode database as data of this benchmark.

The database used was downladed from https://postal.cat a project by [Javier Casares](https://github.com/javiercasares)