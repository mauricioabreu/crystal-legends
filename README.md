# Crystal Legends [![Build Status](https://travis-ci.org/mauricioabreu/crystal-legends.svg?branch=master)](https://travis-ci.org/mauricioabreu/crystal-legends)

League of Legends API wrapper written in Crystal

## Installation

Add the following lines to your `shard.yml` file:

```yaml
dependencies:
  legends:
    github: mauricioabreu/crystal-legends
```

## Usage

```crystal
require "legends"

client = Legends::Client("NA", "my_secret_key_here")
champion = client.champions.find(1, "BR", "v1.2") # finds the champion with ID 1 from BR region using the API version 1.2
puts champion.active # true

# You can also pass a query to filter
champions = client.champions.find("BR", query: {"freeToPlay" => "true"})

# If you need static data like the name of a champion
champion = client.static.champions.find(1)
puts champion.name # Annie
```

