# Crystal Legends

League of Legends API wrapper written in Crystal

## Usage

```crystal
require "legends"

champion = Legends::Champion("NA", "my_secret_key_here")
puts champion.active # true
```

