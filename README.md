# Crystal Legends

League of Legends API wrapper written in Crystal

## Usage

```crystal
require "legends"

client = Legends::Client("NA", "my_secret_key_here")
champion = client.champions.find(1)
puts champion.active # true
```

