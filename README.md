# WeatherForecast API

Este es un pequeño challange para implementar una API y poder comparar el pronóstico del tiempo para los próximos 7 días, por día con [Open Weather](https://openweathermap.org/api), de diferentes destinos que ofrece
[Reservamos](https://documenter.getpostman.com/view/6904537/TzRRCo6f). La aplicación cliente debe poder enviar el nombre de una ciudad y obtener la temperatura máxima y mínima para esos lugares.

## Requerimientos de sistema

- Ruby 3.2.2

## Dependencias

    bundle install

## Base de datos

    bin/rails db:setup

## Correr el servidor

    OPEN_WEATHER_MAP_API_KEY=a5a47c18197737e8eeca634cd6acb581 bin/rails server -p 3000
    
## Guía de uso

Para empezar a consumir la API es necesario consultar la siguiente URL después de levantar el servidor:

    http://localhost:3000/weather_forecast

El endpoint devuelve lugares (ciudades, aeropuertos y terminales de autobús) disponibles en Reservamos y es necesario enviar
el parametro `q` con el nombre parcial o total de un lugar, puede ser una ciudad, aeropuerto o terminal de autobús. Por ejemplo:

    http://localhost:3000/weather_forecast?q=mon

Los resultados serán los mismos que Reservamos API devuelve pero con el pronostico del tiempo de los próximos 7 días de cada coincidencia encontrada.

Nota: Si en los resultado obtenidos la key de `weather_forecast: []` por cada lugar regresa vacío, es posible que la API de Open Weather denege el servicio por
el tipo de subscripción. En algún momento la API Key proporcionada daba resultados satisfactorios pero de último momento la API Key fue bloqueada por Open Weather.
