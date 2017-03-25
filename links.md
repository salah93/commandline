# links

## soft links vs hard links
soft links reference a file (which references an inode) whereas hard links create another file that reference the same inode as the source file

Because of this, if you delete the source file soft links will break and hard links will remain

The underlying reason is because removing a file deletes a reference count in the inode; soft links do not add to the reference count while hard links do.

```
# hard link
ln source_file new_file
# same inode number
ls -i source_file new_file
# soft link
ln -s full_path_to_source_file new_file
# soft link references source file, while source file references inode
ls -i full_path_to_source_file new_file
```

for soft links you need the full path to the source file if link is in a different directory, relative paths will not work
