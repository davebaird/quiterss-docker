# QuiteRss newsreader docker image

## Persistence

Config data and the feeds database and other bits and pieces are stored in your home directory, in folders alongside those used by QuiteRss. So if you already have QuiteRss installed, your existing settings and feeds won't be overwritten. You can easily copy existing files into the dockerised locations, see below.

## Building

Build the container thusly:

```
$ docker build -t quiterss .
```

The startup script refers to the image by name, so you need to use the same name (quiterss) here, or else edit the script.

## Running

Launch the container using the included startup script `d.start.quiterss`

## Display and resolution

The container uses display 99. You can change that by editing `QRSS_DISPLAY` at the top of `d.start.quiterss`.

You can modify the resolution by editing `VNC_RESOLUTION` in `d.start.quiterss`.

### First run

On first launch, the script creates two folders:

```
"$HOME"/.local/share/QuiteRss.docker/QuiteRss
"$HOME"/.config/QuiteRss.docker
```

### Importing an existing feeds database

If you are already using QuiteRss, you can move your existing `feeds.db` file into the new location and the docker version will use that on subsequent runs. The location of the feeds.db file is in Help -> About -> Information

```
$ mv ~/.local/share/data/QuiteRss/QuiteRss/feeds.db ~/.local/share/QuiteRss.docker/QuiteRss/
```

This also works if your `feeds.db` file comes from Windows.

If you have any configuration you want to bring over from another QuiteRss installation, edit the config file at `"$HOME"/.config/QuiteRss.docker/QuiteRss.ini`