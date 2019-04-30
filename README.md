# Zabbix agent deployment for windows

## Download agent through command line
```
download-zabbix-agent.cmd 4.0.7
```

By initiating command without arguments it will download all available packages for 4.2 release
```
download-zabbix-agent.cmd
```

## Detect already installed agent
```
check-agent-installed.cmd
```
this can print content like
```
Zabbix agent:

.. is installed as service

.. already running

binary location:
C:\zabbix\zabbix_agentd.exe

agent version:
4.0.0

.. agent running currently as an process
zabbix_agentd.exe             8264 Services                   0     11 016 K
```
