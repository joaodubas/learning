# elasticsearch 7 and elastic stck

## Section 0

Before running any script, ensure the elasticsearch username/password are set
as environment variables:

```sh
export ES_USERNAME=your-es-user
export ES_PASSWORD=your-es-pass
```

## Section 1

Mainly you will be checking setup and basic operations in elasticsearch.

To download shakespeare mapping and data you can execute:

```sh
./scripts/download_shakespeare.sh
```

To create shakespeare index and load data, execute:

```sh
./scripts/populate_shakespeare.sh
```

## Section 2

Time to experiment with elasticsearch using movie lens dataset.

First of all, download movielens dataset:

```sh
./scripts/download_movie_dataset.sh
```

After that we must create out movie index, and populate it's mapping:

```sh
./scripts/populate_movie_mapping.sh
```

Finally, we'll add a new movie:

```sh
./scripts/populate_movie_interstellar.sh
```

After adding one entry, maybe we could make things easier and add a bunch of
movies using the `_bulk` api:

```sh
./scripts/populate_movie_in_bulk.sh
```

To update fully or partially a given document, we can use the commands in:

```sh
./scripts/update_movie_interstellar.sh
```

Finally, to delete a document execute:

```sh
./scripts/delete_movie_dark_knight.sh
```

As the first challenge you must add, update and delete a movie, this can be
done executing:

```sh
./scripts/exercise_movie_insert_update_delete.sh
```

No man is an island, so are our clients. To avoid concurrency issues we can
check the calls made here:

```sh
./scripts/concurrency_movie.sh
```

To check the use of analyzers and tokenizers in our searchs we can find movies
by title and genre:

```sh
./scripts/search_movie_by_title.sh
./scripts/search_movie_by_genre.sh
```

To recreate the movie index, so genre search only matches exact filters, first
we must delete it:

```sh
./scripts/delete_movie_index.sh
```

Create it again:

```sh
./scripts/create_movie_index.sh
```

And finally, populate the index:

```sh
./scripts/populate_movie_in_bulk.sh
```

After this we can check that our genre search only matches exact phrases:

```sh
./scripts/search_movie_by_genre.sh
```
