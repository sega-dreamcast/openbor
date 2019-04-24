
# OpenBOR Engine for Sega Dreamcast

[OpenBOR](http://www.chronocrash.com/) is a royalty free sprite based side scrolling gaming engine, based on the source code of the [Beats of Rage](https://en.wikipedia.org/wiki/Beats_of_Rage) game published by [Senile Team](http://www.senileteam.com) back in 2004. **Beats of Rage** is an open-source 2D customisable video game engine inspired by Sega's classic [Streets of Rage](https://en.wikipedia.org/wiki/Streets_of_Rage "Streets of Rage") series of [beat'em up](https://en.wikipedia.org/wiki/Beat%27em_up "Beat'em up") games.

From humble beginnings, **OpenBOR Engine** has since grown into the most versatile, easy to use, and powerful engine of its type you will find anywhere. **OpenBOR** is optimized for side scrolling beat em’ up style games ([Double Dragon](https://en.wikipedia.org/wiki/Double_Dragon), [Streets of Rage](https://en.wikipedia.org/wiki/Streets_of_Rage), [Final Fight](https://en.wikipedia.org/wiki/Final_Fight)...), but easily accommodates any sort of gameplay style and feature set you can imagine.

**This repository contains the last version supporting the Sega Dreamcast platform**. The current version of the **OpenBOR Engine** is available [here](https://github.com/DCurrent/openbor).

## Introduction

In 2004, [Senile Team](http://www.senileteam.com) released [Beats of Rage](https://en.wikipedia.org/wiki/Beats_of_Rage), a free beat-'em-up for DOS inspired by Sega's [Streets of Rage](https://en.wikipedia.org/wiki/Streets_of_Rage) series and using sprites from SNK Playmore's [King of Fighters](https://en.wikipedia.org/wiki/The_King_of_Fighters) series. The game spread only by word of mouth, but it nonetheless amassed popularity very quickly. [Senile Team](http://www.senileteam.com) soon released an edit pack allowing anyone interested to create a module for the [Beats of Rage](https://en.wikipedia.org/wiki/Beats_of_Rage) engine.

Later on, the game engine was ported to several systems, including the **Sega Dreamcast**. [The full source code of the original game is available here at GitHub](https://github.com/sega-dreamcast/beats-of-rage).

**Kirby2000** asked [Senile Team](http://www.senileteam.com) to open the source code of [Beats of Rage](https://github.com/sega-dreamcast/beats-of-rage). They agreed, and the **OpenBOR** project was born.

A lot of platforms are supported by the [OpenBOR Team](https://github.com/DCurrent/openbor), and the game engine is still developed. [The official repository of the latest releases of OpenBOR are available here at GitHub](https://github.com/DCurrent/openbor).

The `v3.0 Build 4111` release of the official source code was the last source code revision supporting the Sega Dreamcast platform. Starting from that release, the Sega Dreamcast support was dropped. That's why you'll find in this repository the latest source code release supporting the Sega Dreamcast system, with several changes in order to make this source code compatible with newer [KallistiOS](http://gamedev.allusion.net/softprj/kos/) `v2.0.0+` environments.

## Compiling

Instead of the [Beats of Rage Rumble Edition for Sega Dreamcast](https://github.com/sega-dreamcast/beats-of-rage) project, there is no full SDK provided here for building the engine: you'll need a [KallistiOS](http://gamedev.allusion.net/softprj/kos/) `2.0.0+` environment installed in your computer to do that. It can be either [an installation you did with the standard ways](http://gamedev.allusion.net/softprj/kos/setup.php) or you can use [DreamSDK](https://www.dreamsdk.org/) if you are using *Windows*.

Please also note, the contents of this repository is only for the **OpenBOR Engine**, there is NO game assets at all. You'll need to use a Sega Dreamcast compatible `BOR.PAK` file along with the engine built with this source code to have something that works.

To build the **OpenBOR Engine for Sega Dreamcast**:

1. Open your Shell.
2. Clone this repository: 

	git clone https://github.com/sega-dreamcast/openbor.git
	
3. Enter the `openbor` directory.
4. Enter the following command: 

	./build.sh

A `bin` directory will be created containing the engine binary (`OpenBOR.elf` and `OpenBOR.bin` files). Your **OpenBOR Engine** is now ready to be used on the Sega Dreamcast!

## Usage

To use the compiled **OpenBOR Engine** binary on your Sega Dreamcast, you'll need a Sega Dreamcast compatible `BOR.PAK` containing the game content of your choice. After that, you will just have to generate a selfboot disc image containing at least `1ST_READ.BIN` and `BOR.PAK` files.

To generate a selfboot disc image, you can use the well known methods out there, e.g. if you are using [DreamSDK](https://www.dreamsdk.org/), you may do the following:

	cd bin
	mkdir cd_root
	scramble OpenBOR.bin cd_root/1ST_READ.BIN

Then you will need to put a `BOR.PAK` file in the `cd_root/` directory. Do it then finish the procedure by making the image (a bootstrap `IP.BIN` is provided for convenience in the `tools/ip` directory):

	makedisc openbor.cdi cd_root ../tools/ip/IP.BIN

Your **OpenBOR Engine** game disc is now ready, you can burn it or use it in the [Demul emulator](http://demul.emulation64.com/).

## Credits

The **OpenBOR Engine** is a reality thanks to:

* The whole [OpenBOR Team](http://www.ChronoCrash.com) and contributors: [Damon Caskey](https://github.com/DCurrent), [Plombo](https://github.com/plombo), uTunnels, Anallyst, SumolX, KBbandressen, CGRemakes, LordBall, Tails, Fugue, Kirby2K...
* [Senile Team](http://www.senileteam.com): [Roel](http://www.roelvanmastbergen.nl) aka Opla, Jeroen aka Leila, Sander aka Albatross and Ben.
* [Neill Corlett](http://www.neillcorlett.com) for the original ports like the first iteration of the [Beats of Rage for Sega Dreamcast](https://github.com/sega-dreamcast/beats-of-rage).
* [SiZiOUS](http://www.sizious.com/) for this repository, various fixes and documentation for the Sega Dreamcast system.
