mem=$(free -m | grep Mem | awk '{print $3}')
total=$(free -m | grep Mem | awk '{print $2}')

gb=$(echo $mem | python3 -c "import sys; print(round(int(sys.stdin.read()) / 1024, 2))")
percents=$(echo "$mem $total" | python -c "import sys; a, b = map(int, sys.stdin.read().split()); print(round(a / b * 100, 1))")

# echo "$mem, $total, $percents, $gb"
echo "$gb GB - $percents%"
