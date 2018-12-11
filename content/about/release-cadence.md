---
title: Build & Release Cadence
description: How we manage, number, and support Alameda releases.
weight: 5
---

We produce new builds of Alameda 

## Naming Scheme

We will increase the product's version number only for LTS releases.

Our naming scheme for LTS releases is:

```plain
<major>.<minor>.<LTS patch level>
```

where `<minor>` is increased for every LTS release, and `<LTS patch level>` counts the number of patches for the
current LTS release. A patch is usually a small change relative to the LTS.

For snapshot releases, our numbering scheme is:

```plain
<major>.<minor>.0-snapshot.<snapshot count>
```

where `<major>.<minor>.0` represent the next LTS, and
`<snapshot count>` starts at 0 and increases for every snapshot leading up to the
next LTS.

In the unlikely event we need to issue a patch to a snapshot, it is numbered as:

```plain
<major>.<minor>.0-snapshot.<snapshot count>.<snapshot patch level>
```
