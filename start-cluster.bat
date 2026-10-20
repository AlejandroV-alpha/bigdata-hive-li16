
@echo off
setlocal

echo ==============================================
echo  Despliegue de Hadoop HDFS - Practica LI16
echo ==============================================

rem 1. Construir imagen base de Hadoop
echo [+] Construyendo imagen base Hadoop 3.3.6...
docker build -t hadoop-li16-base:3.3.6 .

if errorlevel 1 (
    echo [!] Error al construir la imagen base.
    exit /b 1
)

rem 2. Levantar servicios con Docker Compose
echo [+] Levantando servicios del cluster...
docker compose up -d

if errorlevel 1 (
    echo [!] Error al levantar los servicios.
    exit /b 1
)

echo ==============================================
echo Cluster Hadoop LI16 iniciado correctamente.
echo NameNode Web UI: http://localhost:9871
echo YARN ResourceManager: http://localhost:8090
echo ==============================================

endlocal
