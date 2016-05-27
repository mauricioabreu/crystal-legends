# Crystal Legends

League of Legends API wrapper written in Crystal

## Usage

```crystal
require "legends"

client = Legends::Client("NA", "my_secret_key_here")
champion = client.champions.find("BR", "v1.2", 1) # finds the champion with ID 1 from BR region using the API version 1.2
puts champion.active # true
```

