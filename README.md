# QuiteRss newsreader docker image

This image uses your own X server to display the QuiteRss newsreader on your desktop.

## Persistence

Config data and the feeds database and other bits and pieces are stored in your home directory. This means the container must have read/write access. If your UID happens to be 1000, you are good to go. For any other UID, you need to edit the Dockerfile `RUN useradd` line to match your UID.

## Building

Build the container thusly:

```
$ docker build -t quiterss .
```

The startup script refers to the image by name, so you need to use the same name (quiterss) here, or else edit the script.

## Running

Launch the container using the included startup script `d.start.quiterss`

### First run

On first launch, this creates two folders:

```
"$HOME"/.local/share/QuiteRss.docker/QuiteRss
"$HOME"/.config/QuiteRss.docker
```

### Importing an existing feeds database

If you are already using QuiteRss, you can move your existing `feeds.db` file into the new location and the docker version will use that on subsequent runs. The location of the feeds.db file is in Help -> About -> Information

```
$ mv ~/.local/share/QuiteRss/QuiteRss/feeds.db ~/.local/share/QuiteRss.docker/QuiteRss/
```

This also works if your `feeds.db` file comes from Windows.

If you have any configuration you want to bring over from another QuiteRss installation, edit the config file at `"$HOME"/.config/QuiteRss.docker/QuiteRss.ini`