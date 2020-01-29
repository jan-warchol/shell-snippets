# Note: this requires Bash >= 4, and is not portable
# (sh doesn't support arrays at all, zsh uses different syntax)

# list environment variables with descriptions
declare -A variables=(
  [FOO]="responsible for blah blah"
  [BAR]="this does something else"
)

# check whether variables are set
for var in ${!variables[@]}; do
  echo $var - ${variables[$var]}
  if [ -z ${!var} ]; then
    echo $var is not set.
  else
    echo $var set to ${!var}.
  fi
done
