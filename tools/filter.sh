#!/bin/bash

input_file=$1

awk -F ',' '
{
    lines[NR] = $0
    if ($1 == "DOMAIN-SUFFIX") {
        suffix_set[$2] = 1
    }
}
END {
    for (i = 1; i <= NR; i++) {
        line = lines[i]
        split(line, parts, ",")
        type = parts[1]
        if (type == "DOMAIN-SUFFIX") {
            print line
        } else if (type == "DOMAIN") {
            domain = parts[2]
            n = split(domain, arr, ".")
            found = 0
            for (j = 1; j <= n && !found; j++) {
                parent = arr[j]
                for (k = j + 1; k <= n; k++) {
                    parent = parent "." arr[k]
                }
                if (parent in suffix_set) {
                    found = 1
                }
            }
            if (!found) print line
        } else {
            print line
        }
    }
}
' "$input_file"