[source](https://gist.github.com/MohamedAlaa/2961058)
# tmux

## install
```
sudo dnf install -y tmux
```

## start up
```
# start up
tmux
# start up with name
tmux new -s name
```

## detach from logged in session
`<ctrl-b> d`

## attach to session
```
tmux a
# attach to named session
tmux a -t name
```

## split screen
`<ctrl-b> %`
+ move between panes `<ctrl-b> <left/right arrow-key>`
+ zoom into one pane `<ctrl-b> z`

## list tmux sessions
```
tmux ls
```
