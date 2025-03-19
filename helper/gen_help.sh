for e in $(grep -E '^[a-zA-Z0-9_-]+:' Makefile | sed 's/:.*//') ; do make -nB  $e ; done | sort | uniq 
