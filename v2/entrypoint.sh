#!/bin/sh
cd /input
if [ -f "requirements.txt" ]
then
  echo ">> Installing requirements.txt"
  pip install --no-cache-dir -r requirements.txt
fi

if [ -z "$1" ]
then
  echo "No python script provided to execute. Please use \`nerd task create <workload-id> -- <python-script>\` and specify the <python-script>."
  exit 1
fi

echo "\n>> Starting python script"
python "$@"
