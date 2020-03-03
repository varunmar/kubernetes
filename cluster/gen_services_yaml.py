#!/bin/env python

import ipaddress

endpoints_prefix = """kind: Service
apiVersion: v1
metadata:
  name: service-%s-pods
spec:
  ports:
  - protocol: TCP
    port: 80
  type: ClusterIP
---
apiVersion: v1
kind: Endpoints
metadata:
  name: service-%s-pods
subsets:
  - addresses:
"""

endpoints_suffix = """    ports:
      - port: 12345
"""

# rules_cases = [1000, 5000, 10000, 20000, 30000]
rules_cases = [1000, 2000, 3000, 4000, 5000, 6000, 7000]

start_ip = int(ipaddress.IPv4Address(u"172.255.21.158")) - sum(rules_cases)

current_ip = start_ip

for i in rules_cases:
#  with open("load-%s-service.yaml" % i, "w") as f:
  with open("service-%s-pods.yaml" % i, "w") as f:
    f.write(endpoints_prefix % (i, i))
    for j in range(i):
      f.write("    - ip: %s\n" % (ipaddress.IPv4Address(current_ip)))
      current_ip = current_ip + 1
    f.write(endpoints_suffix)
    print "service-%s-pods.yaml" % i
