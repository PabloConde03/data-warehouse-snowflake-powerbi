# Proyecto Final: Data Warehouse en Snowflake & Power BI ❄️📊

¡Bienvenido al repositorio de mi proyecto final! 

Este proyecto demuestra la construcción integral de un Data Warehouse desde cero utilizando **Snowflake** para la ingeniería de datos y **Power BI** para la visualización y toma de decisiones empresariales.

## 📂 Estructura del Directorio

El directorio de trabajo está organizado numerando los archivos para seguir el orden lógico de revisión del proyecto:

* 📁 **`000. Workspace_Snowflake/`**
  * Contiene todos los scripts SQL desarrollados durante la práctica. 
  * Están estructurados por las diferentes capas de la arquitectura de datos: creación de base de datos, ingesta de datos brutos (`RAW`), limpieza (`STAGING`), modelado dimensional en estrella (`WAREHOUSE`), creación de vistas seguras (`ANALYTICS`), y automatización incremental (Streams y Tasks).

* 📄 **`001. Memoria - Snowflake.pdf`**
  * Memoria técnica detallada de las **Fases A hasta G**.
  * Explica paso a paso las decisiones arquitectónicas, la generación de datos, la corrección de errores en la importación, la configuración de la seguridad (roles) y el reprocesado de datos por cambios en la lógica de negocio.

* 📊 **`002. Visualización.pbix`**
  * Archivo de **Power BI** correspondiente a la **Fase H** del proyecto.
  * Contiene un cuadro de mando interactivo con 6 visualizaciones clave conectadas directamente a la capa `ANALYTICS` de Snowflake, preparadas para el usuario de negocio.

* 📄 **`003. Análisis de Rendimiento.pdf`**
  * Informe final correspondiente a la **Fase III**.
  * Incluye capturas y análisis detallado de la herramienta *Query Profile* de Snowflake, demostrando la eficiencia y los bajos tiempos de carga de nuestro Modelo en Estrella.

* 📝 **`README.md`**
  * Este archivo de guía y presentación del directorio.

## 🛠️ Tecnologías y Conceptos Aplicados

* **Snowflake:** Arquitectura multi-capa, Vistas Seguras, Control de Acceso Basado en Roles (RBAC), Change Data Capture (CDC) con Streams & Tasks, Time Travel (Reprocesado), Query Profiling.
* **Modelado de Datos:** Esquema en Estrella (Star Schema), SCD Tipo 1.
* **Power BI:** Importación de datos, Modelado visual, DAX básico, Formato condicional y Cuadros de mando ejecutivos.

ç