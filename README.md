# Shadowfax Overlay

Personal Gentoo overlay for hacking on ebuilds.

## Repos.conf

```conf
[shadowfax-overlay]
priority = 50
location = /var/db/repos/shadowfax-overlay
sync-type = git
sync-uri = https://github.com/tmessi/shadowfax-overlay.git
auto-sync = yes
masters = gentoo
```

## Layman

To use the overlay with [layman](https://wiki.gentoo.org/wiki/Layman).

Add the [overlay.xml](https://github.com/tmessi/shadowfax-overlay/blob/master/overlay.xml)
to `/etc/layman/layman.cfg`:

    overlays: http://www.gentoo.org/proj/en/overlays/repositories.xml
              https://raw.githubusercontent.com/tmessi/shadowfax-overlay/master/overlay.xml

Then use layman commands to add the overlay:

    layman -f # force fetch the new overlays after updating layman.cfg
    layman -a shadowfax-overlay
