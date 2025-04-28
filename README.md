# Deprecated

Unfortunately this script relied on the sharedconfig.vdf file to detect categories, this file isn't used anymore making the overlays broken

# Why did I forked this? #

**SteamGrid** isn't maintained a lot so several interesting pull requests or solutions are not embedded in the official repository. I try to integrate them manually in this one to have a working version on the road :)

# Steps to make go work on Steam deck #
1. Open terminal
2. wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
3. sudo tar -C /usr/local/ -xzf go1.19.linux-amd64.tar.gz
4. cd /usr/local/
5. echo $PATH
6. sudo nano $HOME/.profile
7. add : export PATH=$PATH:/usr/local/go/bin (sometimes you might want to force file modification)
8. source $HOME/.profile
9. cat $HOME/.profile
10. check with go version

# To compile the script
1. In the chosen folder : git clone https://github.com/nithou/steamgrid
2. cd steamgrid
3. go build

# What is it? #

**SteamGrid** is a standalone, fire-and-forget program to enhance Steam's grid view and Big Picture. It preloads the banner images for all your games (even non-Steam ones) and applies overlays depending on your categories.

You run it once, and it'll set up everything above, automatically, keeping your existing custom images. You can run
again when you get more games or want to update the category overlays.

# How to use #

1. Compile the latest version based on this branch
2. *(optional)* Name the overlays after your categories. So if you have a category “Games I Love”, put a nice little heart overlay there named `games i love.banner.png`. You can rename the defaults that came with the zip or get new ones at [/r/steamgrid](http://www.reddit.com/r/steamgrid/wiki/overlays).
    * Add the extension `.banner` before the image extension for banner art: `games i love.banner.png`
    * Add the extension `.cover` before the image extension for cover art: `games i love.cover.png`
    * Add the extension `.hero` before the image extension for hero art `games i love.hero.png`
    * Add the extension `.logo` before the image extension for logo art `games i love.logo.png`
3. *(optional)* Download a pack of custom images and place it in the `games/` folder. The image files can be either the name of the game (e.g. `Psychonauts.banner.png`) or the game id (e.g. `3830.png`).
    * Add the extension `.banner` before the image extension for banner art: `Psychonauts.banner.png`, `3830.png`
    * Add the extension `.cover`/`p` before the image extension for cover art: `Psychonauts.cover.png`, `3830p.png`
    * Add the extension `.hero`/`_hero` before the image extension for hero art `Psychonauts.hero.png`, `3830_hero.png`
    * Add the extension `.logo`/`_hero` before the image extension for logo art `Psychonauts.logo.png`, `3830_logo.png`
4. *(optional)* Generate a some API Keys to enhance the automatic search:
    * [SteamGridDB API Key](https://www.steamgriddb.com/profile/preferences)
    * [IGDB API Client/Secret](https://api-docs.igdb.com/#about)
5. Run `steamgrid` and wait. No, really, it's all automatic. Not a single key press required.
    * *(optional)* Append `--steamgriddb <api key>` if you've generated one before.
    * *(optional)* Append `--igdbclient <igdb client>` if you've genereated one before.
    * *(optional)* Append `--igdbsecret <igdb secret>` if you've genereated one before.
    * *(optional)* Append `--types <preference>` to choose your preferences between animated steam covers or static ones Available choices : `animated`,`static`. Default : `static`. You can use `animated,static` to download both while preferring animated covers, and `static,animated` for preferring static covers.
    * *(optional)* Append `--styles <preference>` to choose your preferences between the different covers styles from steamgriddb. Available choices : `material`,`white_logo`,`alternate`,`blurred`,`no_logo`. Default: `alternate`. You can also input multiple comma-separated choices in the same manners of the `--types` argument.
    * *(optional)* Append `--herostyles <preference>` to choose style for hero artwork. Available choices : `material`,`alternate`,`blurred`. Default: `alternate`.
    * *(optional)* Append `--logostyles <preference>` to choose style for logo artwork. Available choices : `official`,`white`,`black`,`custom`. Default: `official`.
    * *(optional)* Append `--appids <appid1,appid2>` to only process the specified appID(s)
    * *(optional)* Append `--onlymissingartwork` to only download artworks missing on the official servers.
    * *(optional)* Append `-nonsteamonly` to only search artworks for non-steam games added onto the Steam client.
    * *(optional)* Append `-skip<preference>` to skip searching and downloading parts from certain artwork elements. Available choices : `-skipbanner`,`-skipcover`,`-skiphero`,`-skiplogo`. For example: Appending `-skiplogo -skipbanner` will prevent steamgrid to search and download logo and banners for any games.
    * *(optional)* Append `-skipsteam` to not download the default artworks from Steam.
    * *(optional)* Append `-skipgoogle` to skip search and downloads from Google.
    * *(optional)* Append `--ignorebackup` to ignore backups when looking for artwork
    * *(optional)* Append `--ignoremanual` to ignore manual customization when looking for artwork
    * *(optional)* Append `--skipCategory <category>` to skip processing of games assigned to a specific Steam category
    * *(optional)* Append `--steamgriddbonly` to search for artwork only in SteamGridDB
    * *(optional)* Append `--namefilter "<text>"` to process only games with names that contain provided *text*
    * *(optional)* Append `--searchcustomgames` if you have non-steam games that have a page in the steam store
    * *(tip)* Run with `--help` to see all available options again.
6. Read the report and open Steam in grid view to check the results.

---

[![Results](https://i.imgur.com/HiBCe7p.png)](https://i.imgur.com/HiBCe7p.png)
[![Grid view screenshot](http://i.imgur.com/abnqZ6C.png)](http://i.imgur.com/abnqZ6C.png)
[![Big Picture screenshot](http://i.imgur.com/gv7xDda.png)](http://i.imgur.com/gv7xDda.png)
