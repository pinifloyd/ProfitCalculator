# Security

1) Создаем пользователя deployer, хоть он и в списках ботнет сетей.
2) Запрет root подключаться по паролю, только по ключу. Тоже и для обычных пользователей. Разрешены только ключи.
3) К базе можно подключиться если изменить peer -> trust
4) Firewall, открыты только 22 (ssh) и 80 (http) порты
5) Fail2ban, баняться IP адреса, которые стучаться на 22 порт с неудачной авторизацией (3 раза в течение 1 часа) на 12 часов

# Setup

Создаем дроплет в DO, ничего сложного нет, просто выбираем параметры, которые нам нужны. Выбираем нужные ключи ssh. Потом можем подключиться с выбранным ключем:

```
$ ssh root@droplet-ip
```

Обновляем систему:

```
$ apt-get update && apt-get upgrade
```

# SSH

Создаем обычного юзера, то есть deployer:

```
$ adduser deployer
```

Добавляем пользователя deployer в группу sudo:

```
$ gpasswd -a deployer sudo
```

Меняем пользователя с root на deployer:

```
$ su - deployer
```

Создаем ему директорию где будут лежать допустимые ключи:

```
$ mkdir ~/.ssh && chmod 700 ~/.ssh
```

Создаем файл для разрешенных ключей и копируем туда ключи:

```
$ vim ~/.ssh/authorized_keys
```

Изменяем права на файл с ключами:

```
$ chmod 600 ~/.ssh/authorized_keys
```

Выходим из этого пользователя (deployer) и становимся root

```
$ exit
```

Разрешаем root подключаться только по ключам:

```
$ vim /etc/ssh/sshd_config -> (PermitRootLogin without-password)
```

Или запрещаем вообще root подключаться:

```
$ vim /etc/ssh/sshd_config -> (PermitRootLogin no)
```

Убираем подключение по паролю для всех вообще, связано с UsePAM yes:

```
$ vim /etc/ssh/sshd_config -> (PasswordAuthentication no)
```

Перезапускаем ssh сервис

```
$ restart ssh
```

# RBENV

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

Пока только: Install rbenv, Install Ruby, Install Javascript Runtime

Тут же ставим и imagemagick:

```
$ sudo apt-get install imagemagick
```

# PostgreSQL

https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04

```
$ sudo apt-get install postgresql postgresql-contrib libpq-dev
```

По умолчанию будет запрещено заходить в бд, поэтому на время:

Разрешаем коннект к базе:

```
$ sudo vim /etc/postgresql/9.5/main/pg_hba.conf (peer -> trust)
$ sudo service postgresql restart
```

Создаем пользователя username с разрешением на создание базы и паролем:

```
$ sudo -u postgres createuser -P -d username (username1)
```

Запрещаем коннект к базе

```
$ sudo vim /etc/postgresql/9.5/main/pg_hba.conf (peer -> trust)
$ sudo service postgresql restart
```

# NGINX

Пока просто устанавливаем сервер:

```
$ sudo apt-get install nginx
```

# Redis Server

Пока просто ставим redis-server

```
$ sudo apt-get install redis-server
```

# IPTABLES

Настройки по умолчанию (можно получить сбросив текущие):

```
$ sudo iptables -F
```

```
$ sudo iptables -S
# -P INPUT ACCEPT
# -P FORWARD ACCEPT
# -P OUTPUT ACCEPT
```

Ставим iptables-persistent, чтобы иметь возможность сохранять политику прав:

```
$ sudo apt-get install iptables-persistent
```

```
Просит сохранить текущие настройки, соглашаемся - должны появиться новые файлы:
```

# /etc/iptables/rules.v4
# /etc/iptables/rules.v6

Ниже содержимое rules.v4:

```
*filter
:INPUT ACCEPT [276:32513]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [267:63700]

# Accept all local trafic
-A INPUT -i lo -j ACCEPT

# Accept all active connections
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Accept ssh and web
-A INPUT -p tcp --dport 22 -j ACCEPT
-A INPUT -p tcp --dport 80 -j ACCEPT

# Potential Risk - DDOS from botnet may be success but if us will attack one
# hacker it is good idea. So we can try to show us as Windows and trap
# hacker's resources.
# -A INPUT -p tcp -m tcp -m multiport --dports 21 -j TARPIT
# -A INPUT -p tcp -m tcp -m multiport --dports 135 -j TARPIT
# -A INPUT -p tcp -m tcp -m multiport --dports 139 -j TARPIT
# -A INPUT -p tcp -m tcp -m multiport --dports 1025 -j TARPIT

# Catch all trafic (tarpit)
# -A INPUT -p tcp -m tcp -j TARPIT
# -A INPUT -p udp -j DROP

# Drop all trafic
-A INPUT -j DROP

COMMIT
```

Можно еще настроить и icmp, но пока этого не делал. https://ru.wikipedia.org/wiki/ICMP, поэтому пока просто сохраняем и загружаем:

```
$ sudo cat /etc/iptables/rules.v4 | sudo iptables-restore -c
```

Комментарии:

Скидываем трафик forward, так как мы не роутер и не перенаправляем его никуда.
# :FORWARD DROP [0:0]

Все остальные правила вносим перед COMMIT. Разрешаем локальный трафик:
# -A INPUT -i lo -j ACCEPT

Разрешаем все установленные активные соединения, иначе исходящие пакеты будут откланяться:
# -A INPUT -m state --state RELATED,ESTABLISHED -p all -j ACCEPT

Разрешаем ssh:
# -A INPUT -m state --state NEW -p tcp --dport 22 -j ACCEPT

Разрешаем web:
# -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT

Ставим ловушку для ботов (сначала нужно установить tarpit: xtables-addons-dkms - xt_TARPIT):
# -A INPUT -p tcp -m tcp -j TARPIT
# -A INPUT -p udp -j DROP

# FAIL2BAN

Ставим прогу:

```
$ sudo apt-get install fail2ban
```

Копируем конфиг:

```
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Правим по необходимости и перезапускаем:

```
$ sudo vim /etc/fail2ban/jail.local
$ sudo service fail2ban stop
$ sudo service fail2ban start
```
