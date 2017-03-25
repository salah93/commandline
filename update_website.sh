name=$1
shift
tags=
target=~/Projects/salah93.github.io/_posts/commandline/`ds`-$name
cat <<EOF > $target 
---
layout: post
category : command-line
tagline:
tags : [commandline, unix, $(echo $@ | sed 's/ /, /')]
---
{% include JB/setup %}

EOF

cat $name >> $target 
