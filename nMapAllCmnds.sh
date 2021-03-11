# Intense scan : -A for OS detection (-O), version detection (-sV), script scanning (-sC), and traceroute (--traceroute).
nmap -T4 -A -v $1

# Intense scan and scanning TCP and UDP ports: OS detection (-O), version detection (-sV), script scanning (-sC), and traceroute (--traceroute)
nmap -sS -sU -T4 -A -v $1

# Intense scan, all TCP ports: OS detection (-O), version detection (-sV), script scanning (-sC), and traceroute (--traceroute)
nmap -p 1-65535 -T4 -A -v $1

# Intense scan, no ping: without checking to see if targets are up first
nmap -T4 -A -v -Pn $1

# Ping scan: Only finds which targets are up and does not port scan them.
nmap -sn $1

# Quick scan: faster than a normal scan because it uses the aggressive timing template and scans fewer ports.
nmap -T4 -F $1

# Quick scan plus OS and version detection.
nmap -sV -T4 -O -F --version-light  $1

# Quick traceroute: Traces the paths to targets without doing a full port scan on them.
nmap -sn --traceroute  $1

# Regular or basic scan
nmap  $1

# Slow comprehensive scan: Every TCP and UDP port is scanned. OS detection (-O), version detection (-sV), script scanning (-sC), and traceroute (--traceroute) are all enabled
nmap -sS -sU -T4 -A -v -PE -PS80,443 -PA3389 -PP -PU40125 -PY --source-port 53 --script "default or (discovery and safe)"  $1

# Performs a HEAD request for the root folder ("/") of a web server and displays the HTTP headers returned.
nmap --script http-headers  $1

# Running all scripts omitting those in the vuln category
nmap --script "not vuln"  $1

# All categories for scripts: auth, broadcast, brute, default, discovery, dos, exploit, external, fuzzer, intrusive, malware, safe, version and vuln
# Safe scripts: auth broadcast default discovery external malware safe version vuln
# All scripts scans: auth broadcast brute default discovery dos exploit external fuzzer intrusive malware safe version vuln
for VARIABLE in auth broadcast default discovery external malware safe version vuln
do
nmap --script $VARIABLE  $1

done
