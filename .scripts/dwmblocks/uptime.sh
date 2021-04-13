up=$(uptime -p | sed s/,//g | python -c "import sys; s = sys.stdin.read().strip(); s = s.replace(' hour', 'h'); s = s.replace(' minutes', 'm'); print(s)")

echo $up
