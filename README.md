Shadowfax Overlay
=================

Personal Gentoo overlay for hacking on ebuilds.

Layman
------

To use the overlay with [layman](https://wiki.gentoo.org/wiki/Layman).

Add the [overlay.xml](https://github.com/shadowfax-chc/shadowfax-overlay/blob/master/overlay.xml)
to `/etc/layman/layman.cfg`:

    overlays: http://www.gentoo.org/proj/en/overlays/repositories.xml
              https://raw.githubusercontent.com/shadowfax-chc/shadowfax-overlay/master/overlay.xml

Then use layman commands to add the overlay:

    layman -f # force fetch the new overlays after updating layman.cfg
    layman -a shadowfax-overlay
