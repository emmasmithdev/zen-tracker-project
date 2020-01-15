CO2 and You

This is an app which measures a user's carbon footprint according to the input entered.
It can store a user's history for comparison with the UK average and their own usage in time.
The app also displays a chart of usage, divided into diet, transport, home.

In terminal in 'server' directory:
Because package lock contains information about the packages used, 'npm init' and 'npm install' should be all that is needed


1) npm init
2) npm install
3) npm install express
4) npm install cors
5) npm install mongodb
6) npm install body-parser
7) npm install nodemon
8) mongo < db/seeds.js
9) npm run server:dev



In terminal in 'client':
1) npm install
2) npm run serve

NB: In 'client' if Highcharts and Moment aren't running properly,
run the following:
 in terminal:
1) run npm install --save highcharts-vue
2) run npm install moment


To view the app in localhost:
1) Open browser and enter: http://localhost/8080 for the client view.
2) Open another tab and enter: http://localhost/3000 for the server.                      
