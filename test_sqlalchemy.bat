REM Create Database
python -m sqlalchemy_manager.manager db init
python -m sqlalchemy_manager.manager db migrate
python -m sqlalchemy_manager.manager db upgrade

REM Run Server
python -m sqlalchemy_manager.manager runserver -p 8080 -d

REM Test Funcions
set ip=127.0.0.1
set port=8080

curl -X POST -d "name=a01" -d "latitude=23.5" -d "longitude=121.5"  http://%IP%:%Port%/devices
curl -X POST -d "name=a02" -d "latitude=23.5" -d "longitude=121.5"  http://%IP%:%Port%/devices
curl -X POST -d "name=a03" -d "latitude=23.5" -d "longitude=121.5"  http://%IP%:%Port%/devices

curl -X POST -d "device_id=1" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs
curl -X POST -d "device_id=1" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs

curl -X POST -d "device_id=2" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs
curl -X POST -d "device_id=2" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs

curl -X POST -d "device_id=3" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs
curl -X POST -d "device_id=3" -d "temperature=23.5" -d "humidity=98.5"  http://%IP%:%Port%/logs

curl http://%IP%:%Port%/devices
curl http://%IP%:%Port%/logs

curl http://%IP%:%Port%/init_db