#!/bin/bash
current=/tmp/flashdownload

download() {
  if ! grep -q "$1" "$current"; then
    printf "%s\n" "$1" >> "$current"
    tail -n +0 --pid="$3" --follow "$1" > "$2"
    sed -i "\|$1|d" "$current"
  else
    printf "%s\n" "$1 is alread downloading" >&2
  fi
}

while IFS= read -rd '' s; do
  d=$HOME/${s##*/}
  p=$(cut -d '/' -f 3 <<<"$s")
  printf "%s\n" "tailing $s to $d from PID $p"
  download "$s" "$d" "$p" &
done < <(find /proc/*/fd -lname "/tmp/Flash*" -print0 2>/dev/null)
wait
