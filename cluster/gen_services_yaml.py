#!/bin/env python

import ipaddress

endpoints_prefix = """kind: Service
apiVersion: v1
metadata:
  name: load-%s-pods
spec:
  ports:
  - protocol: TCP
    port: 80
  type: ClusterIP
---
apiVersion: v1
kind: Endpoints
metadata:
  name: load-%s-pods
subsets:
  - addresses:
"""

endpoints_suffix = """    ports:
      - port: 12345
"""

rules_cases = [1000, 5000, 10000, 20000, 30000]

start_ip = int(ipaddress.IPv4Address(u"172.255.255.254")) - sum(rules_cases)

current_ip = start_ip

for i in rules_cases:
  with open("load-%s-service.yaml" % i, "w") as f:
    f.write(endpoints_prefix % (i, i))
    for j in range(i):
      f.write("    - ip: %s\n" % (ipaddress.IPv4Address(current_ip)))
      current_ip = current_ip + 1
    f.write(endpoints_suffix)
    # print ---
    print "load-%s-service.yaml" % i
