# QuiteRss newsreader docker image

This image uses your own X server to display the reader, so
I have no idea how to make it work on Windows.

Build the container thusly:

```
$ docker build -t quiterss .
```

Launch the container using the included startup script `d.start.quiterss`

On first launch, this creates two folders:

```
"$HOME"/.local/share/QuiteRss.docker/QuiteRss
"$HOME"/.config/QuiteRss.docker
```

If you are already using QuiteRss, you can move your existing `feeds.db` file into the new location and the docker version will use that on subsequent runs. The location of the feeds.db file is in Help -> About -> Information

```
$ mv ~/.local/share/QuiteRss/QuiteRss/feeds.db ~/.local/share/QuiteRss.docker/QuiteRss/
```

This also works if your `feeds.db` file comes from Windows.

If you have any configuration you want to bring over from another QuiteRss installation, edit the config file at `"$HOME"/.config/QuiteRss.docker/QuiteRss`