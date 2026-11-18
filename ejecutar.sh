#!/usr/bin/env bash
# Compila y ejecuta MiDUNAB sin Maven (solo necesita el JDK 17 o superior).
# Uso: bash ejecutar.sh
set -e
cd "$(dirname "$0")"
rm -rf out
mkdir -p out
# -sourcepath compila Main.java y todas las clases que usa
javac -encoding UTF-8 -d out -sourcepath src/main/java src/main/java/co/edu/unab/midunab/Main.java
cp -r src/main/resources/* out/
java -cp out co.edu.unab.midunab.Main
