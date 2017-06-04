[Maltrail](https://github.com/stamparm/maltrail) is a malicious traffic detection system, utilizing publicly available (black)lists containing malicious and/or generally suspicious trails, along with static trails compiled from various AV reports and custom user defined lists, where trail can be anything from domain name (e.g. zvpprsensinaix.com for Banjori malware), URL (e.g. http://109.162.38.120/harsh02.exe for known malicious executable), IP address (e.g. 185.130.5.231 for known attacker) or HTTP User-Agent header value (e.g. sqlmap for automatic SQL injection and database takeover tool). Also, it uses (optional) advanced heuristic mechanisms that can help in discovery of unknown threats (e.g. new malware).


## docker-compose.yml

----

```
version: '2'
services:
  server:
    image: tomdesinto/maltrail
    volumes:
      - ./maltrail.conf:/maltrail/maltrail.conf:ro
    ports:
      - 8338:8338
      - 127.0.0.1:8337:8337/udp
      - ./logs:/var/log/maltrail
    command: python server.py
    
  sensor:
    image: tomdesinto/maltrail
    privileged: true
    network_mode: host
    volumes:
      - ./maltrail.conf:/maltrail/maltrail.conf:ro
    command: python sensor.py
```

----

The maltrail configuration can be downladed at : https://raw.githubusercontent.com/thomasleveil/doco-maltrail/master/maltrail.conf

Then visit http://127.0.0.1:8338/ and sign in with `admin`:`changeme!`. 