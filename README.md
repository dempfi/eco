[![Slack Room][slack-badge]][slack-link]

# Eco

Eco-minimal gray scale prompt.

![eco]

## Install

With [Fisherman]

```fish
fisher i eco
```

## Option

* $eco_remote_update_interval: Interval in seconds to defer running `git remote update` in the background.

## Legend

* `dir master& repo →` Git update remote running in the background.
* `dir ╍ master repo →` There are changes not staged for commit (dirty).
* `dir ╍ master ∧ repo →` Dirty and repo can push to remote.
* `dir ╍ master ∨ repo →` Dirty and repo can pull from remote.
* `dir + master ∧∨ repo →` Staged changes and repo can push and pull from remote.
* `dir ± master repo →` Dirty and also changes staged for commit.
* `dir 8bc1479 repo →` Detached HEAD state.
* `dir master ← repo →` There are changes recorded in the stash.
* `→ 127` Last command $status.
* `33ms` Last command duration.

## Terminal Settings

* [Eco.terminal]
* [Eco.itermcolors]
* Font: 16pt Source Code Pro Medium

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://img.shields.io/badge/slack-join%20the%20chat-00B9FF.svg?style=flat-square

[Fisherman]: https://github.com/fisherman/fisherman
[eco]: https://cloud.githubusercontent.com/assets/8317250/13768992/4e42969c-eabf-11e5-9d94-d5d1bcd9498e.png

[Eco.itermcolors]: https://github.com/fishery/eco/raw/master/Eco.itermcolors
[Eco.terminal]: https://github.com/fishery/eco/raw/master/Eco.terminal
