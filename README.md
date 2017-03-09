# PhxPingu

New Phoenix (1.30-rc1) generators and file layout.

Generated with

```
mix phx.gen.html Colony Penguin penguins name:string species:string noot_noot:string
```


## Running

First time

```
git clone git@github.com:paulanthonywilson/pingu.git
cd pingu
mix deps.get
cd assets
npm install && node node_modules/brunch/bin/brunch build
cd ..
```

To run.

```
iex -S mix phx.server
```
