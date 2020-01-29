# Good source of knowledge about this topic:
# http://mywiki.wooledge.org/BashFAQ/006#Indirection

counter=0
for var in FIRST SECOND THIRD; do
    counter=$(( $counter + 1))

    # this won't work because it's not recognized as assignment
    # $var=$counter   # => "command not found"

    # this works, but keep in mind that eval may not be a good idea
    # https://stackoverflow.com/q/17529220/2058424
    # http://mywiki.wooledge.org/BashFAQ/048
    # eval $var=$counter

    # there is another syntax that does the same as above
    declare $var=$counter

    # this is invalid syntax ("bad substitution")
    # echo $var is set to ${$var}

    # this is proper way to acess variable indirectly
    echo $var is set to ${!var}
done

echo $FIRST $SECOND $THIRD   # see, above worked as expected
