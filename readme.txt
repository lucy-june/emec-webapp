# For Demo:
- Sysetm requirement: windows 2016 server base/ windows 2016 server data center/ windows 7.
- Install nodejs(include node + npm): https://nodejs.org/dist/v4.4.4/node-v4.4.4-x64.msi
  - node: v4.4.4
  - npm: v2.15.1
- start files: "$ node admin" (for admins, use http), "$ node sale(for salesman, use https), "$ node app" (for customers' app, use restful service)
- request entry: routes/. res.render (for web pages), res.send (for web service)
- web pages: views/
- security.auth.js for authentication and authorization.

# For Dev:
Install nodejs(include node + npm): https://nodejs.org/dist/v4.4.4/node-v4.4.4-x64.msi
  - node: v4.4.4
  - npm: v2.15.1
Database: mysql v5.6
IDE: webstorm 11.0.2
To run the project:
  - You can use IDE, to run bin/admin, bin/sale, bin/app
  - You can also use cmd, cd to bin/ and run $ node admin, $ node sale, $ node app.

ftp Server:
ftp://202.120.40.140:221
xjhdev adc5320
xjhuser xjh5320


mysql Server: 
202.120.40.140  mec_admin  passw0rd
mysql -h 202.120.40.140 -u mec_admin -ppassw0rd mec
高权限用户 mecqa passw0rd


git Server:
http://202.120.40.150/gitserver/xjhmec.git
http://202.120.40.150/gitserver/mec_webapp.git
http://202.120.40.150/gitserver/mec_promotion_engine.git
http://202.120.40.150/gitserver/mec_search_engine.git
http://202.120.40.150/gitserver


remote Desktop:
203.110.178.83:6121 administrator  yuhan2012
202.120.40.140:4000 CLOUD\Administrator adc5320!@#$
202.120.40.150:4000 user1 pass@word2adc

Oracle:
dep6 adc5320

MIS:
000066 密码为空


Deployment:
node     master/slave 10.68.0.2/10.68.0.3       mecuser/abc123
engine   master/slave 10.68.0.21/10.68.0.22     mec/rootroot
db       master/slave 10.68.0.52/10.68.0.53     mec/rootroot
MIS 地址：         126.200.200.101
Node 模拟外网地址：200.200.200.254
ps -ef |grep node
kill -9 [pid]


http://metroui.org.ua/v2/

test环境：126.200.168.3  mec/xjHmec1531
