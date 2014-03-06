#!/usr/bin/env bash
# Script to open Vimprobable instances in tabbed

exec vimprobable2 -e $(</tmp/tabbed.xid) "$1" &

