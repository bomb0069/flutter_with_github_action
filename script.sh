#!/bin/bash
mkdir -p screenrecord
adb devices -l

adb -s test shell screenrecord /sdcard/example.mp4 &
sleep 5
flutter test integration_test || true
adb -s test shell pkill -INT screenrecord &
sleep 15
adb pull /sdcard/example.mp4 screenrecord/
